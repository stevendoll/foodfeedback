class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :invite, :destroy]
  after_action :verify_authorized

  def index
    authorize User
    @users = policy_scope(User)
  end

  def show
    authorize @user

    #params = {"food_id" => "33691", "method" => "food.get"}
    params['method'] = 'food_entries.get_month'
    params['format'] = 'json'

    # food_entries.get_month
    @body = ""

    begin
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
    rescue => e
      logger.warn "Fatsecret failure: #{e}" 
    end


    #@something = body.month.day.calories
    #@calories = @body[:month][:day][:calories]

    #puts @calories

  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role, :name, :email, :authentication_token, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone, :description, :avatar, :invitation_code, :tag_list, :account_id)
  end

end
