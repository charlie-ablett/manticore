class UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @search = User.find(params[:id])
    respond_with @search
  end

  def results
    @results = User.search_results params[:query]
    respond_with @results, root: false
  end

  def new
    @search = User.new
  end

  def edit
  end

  def create
    @search = User.new(user_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @search }
      else
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @search.update(user_params)
        format.html { redirect_to @search, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @search = User.find(params[:id])
    end

    def user_params
      params.require(:search).permit(:name, :email)
    end
end
