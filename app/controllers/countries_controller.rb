class CountriesController < ApplicationController
  respond_to :json

  def index
    @countries = Country.all
    respond_with @countries
  end

  def show
    @country = Country.find(params[:id])
    respond_with @country
  end

  def current_collection
    @current_countries = Country.all #this will change to be the searched ones
    respond_with @current_countries
  end
end
