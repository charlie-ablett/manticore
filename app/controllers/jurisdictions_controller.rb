class JurisdictionsController < ApplicationController
  respond_to :json

  def index
    @jurisdictions = Jurisdiction.all
    respond_with @jurisdictions
  end

  def show
    @jurisdiction = Jurisdiction.find(params[:id])
    respond_with @jurisdiction
  end
end
