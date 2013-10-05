class AddressesController < ApplicationController
  respond_to :json

  def index
    @addresses = Address.all
    respond_with @addresses
  end

  def show
    @address = Address.find(params[:id])
    respond_with @address
  end
end
