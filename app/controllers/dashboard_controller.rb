class DashboardController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @user = current_user
    authorize @user

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

  end
end
