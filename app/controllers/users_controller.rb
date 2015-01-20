class UsersController < ApplicationController
  before_filter :authenticate_user!
  #after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])

    #params = {"food_id" => "33691", "method" => "food.get"}
    params['method'] = 'food_entries.get_month'
    params['format'] = 'json'

    # food_entries.get_month

    response = Fatsecret::Api.new({}).api_call(
      Rails.application.secrets.fatsecret_consumer_key, 
      Rails.application.secrets.fatsecret_consumer_secret,
      params, 
      @user.fatsecret_token,
      @user.fatsecret_secret
    )

    @body = JSON.parse(response.body)
    #body = response.body

    puts @body


    #@something = body.month.day.calories
    #@calories = @body[:month][:day][:calories]

    #puts @calories

    #authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
