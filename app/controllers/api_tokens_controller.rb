class ApiTokensController < ApplicationController

  # POST /api_tokens
  def create
    @user = current_user
    @user.fatsecret_token = request.env['omniauth.auth']['credentials'].token
    @user.fatsecret_secret = request.env['omniauth.auth']['credentials'].secret

    # logger.info request.env['omniauth.auth']['credentials']
    # puts request.env['omniauth.auth']['credentials']

    if @user.save
      redirect_to dashboard_path, notice: 'User updated.'
    else
      render :new
    end
  end
end
