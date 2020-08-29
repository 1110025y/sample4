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


  def category
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  


  def edit
    @item = Item.find(params[:id])
    @item.edit
    redirect_to root_path
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


  private

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_id, :shipping_date_id , :delivery_fee_id, :status_id, :introduction, :brand, images_attributes: [:item_image, :_destroy, :id])
  end
  
end
