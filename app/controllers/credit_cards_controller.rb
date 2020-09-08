class CreditCardsController < ApplicationController
  require "payjp"

  def new
    
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new" # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = CreditCard.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_path(:id), notice: "Credit card registration completed！"
      else
        redirect_to action: "new"
      end
    end
  end
  

  def show #Cardのデータpayjpに送り情報を取り出します
    @card = CreditCard.where(user_id: current_user.id).first
    if @card.blank?
      flash[:notice] = "Please credit card registration！"
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  
  def destroy 
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "show"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      if @card.destroy
        redirect_to user_path(:id), notice: "Credit card has been deleted!"
      else
        redirect_to action: "show"
      end
    end
  end


end
