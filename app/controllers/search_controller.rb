class SearchController < ApplicationController
  respond_to :html

  def index

  end

  def results
    @results = Search.search_results params[:query]
    respond_with @results, root: false
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

end
