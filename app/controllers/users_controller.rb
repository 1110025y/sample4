class UsersController < ApplicationController
  

  def new
  end
  
  # def create
  #   @user = User.create(user_registration_params)
  #   @nickname = current_user.nickname
  # end
  


  def show
    @items = Item.all
    @nickname = current_user.nickname
  end

  def exhibitedShow
    @items = Item.all
    @nickname = current_user.nickname
    
  end

  def setUpShow
    @address = current_user.address
  end

  def purchaseGoods
    @items = Item.all
  end

  def commentGoods
    @items = Item.all
    @comments = Comment.all
  end

  # private
  # def user_registration_params
  #   params.require(:user).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana)
  # end
end
