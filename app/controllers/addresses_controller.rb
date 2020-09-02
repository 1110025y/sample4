class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(:id)
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :apartment, :contact, :phone_number).merge(user_id: current_user.id)
  end

end
