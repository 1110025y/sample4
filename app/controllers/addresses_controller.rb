class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(:id), notice: "Address registration completed！"
    else
      render :new
    end
  end

  def edit
    @address = current_user.address
    if @address.blank?
      flash[:alert] = "Please register your address！"
      redirect_to action: "new"
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(:id), notice: "Registration information change completed！"
    else
      render :edit
    end
  end
  

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :apartment, :contact, :phone_number).merge(user_id: current_user.id)
  end

end
