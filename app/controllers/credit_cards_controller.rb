class CreditCardsController < ApplicationController
  require "payjp"

  def new
    
  end

  def create
    Payjp.api_key = "sk_test_eecf4c9853b6665b3a9699a6"
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = CreditCard.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = '登録しました'
        redirect_to user_path(:id)
      else
        flash[:alert] = '登録できませんでした'
        redirect_to action: "new"
      end
    end
  end
  
  def show #Cardのデータpayjpに送り情報を取り出します
    @card = CreditCard.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_eecf4c9853b6665b3a9699a6"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def destroy 
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "show"
    else
      Payjp.api_key = "sk_test_eecf4c9853b6665b3a9699a6"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      if @card.destroy
        redirect_to user_path(:id), notice: "削除が完了しました"
      else
        edirect_to action: "show", alert: "削除できませんでした。"
      end
    end
  end


end
