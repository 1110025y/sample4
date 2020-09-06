class ItemsController < ApplicationController
  

  def index
    @items = Item.includes(:images).order('created_at DESC') #トップページに表示、更新した順番で
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)

  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to user_path(:id), notice: "商品出品が完了しました！"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item.edit
    redirect_to root_path
  end


  def show
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @category = Category.find(@item.category_id)
    @user = User.find(@item.user_id)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end


  def purchase
    @family_name = current_user.family_name
    @first_name = current_user.first_name
    @item = Item.find(params[:id])
    @card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = "sk_test_eecf4c9853b6665b3a9699a6"
    if @card.blank?
      redirect_to user_path(:id), alert: "購入前にカード登録してください！"
    else
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = @customer.cards.retrieve(@card.card_id)
    end

    if current_user.address.present?
      @address = current_user.address
    else
      redirect_to user_path(:id), alert: "購入前に住所登録してください！"
    end
  end


  def pay
    @item = Item.find(params[:id])
    @card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = "sk_test_eecf4c9853b6665b3a9699a6"
    
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
    )

    @item.update(buyer_id: current_user.id)
    redirect_to user_path(:id), notice: '商品の購入が完了しました！'
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_id, :category_id, :shipping_date_id , :delivery_fee_id, :buyer_id, :status_id, :introduction, :brand, images_attributes: [:item_image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
end
