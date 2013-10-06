class SearchController < ApplicationController

  respond_to :html

  def index

  end

  def show
    @search = Search.find(params[:id])
    respond_with @search
  end

  def new
    @search = Search.new
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

  def user_params
    params.require(:search).permit(:name, :email)
  end
end