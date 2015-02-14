class DashboardController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @user = current_user
    authorize :client_dashboard

    if current_user.admin? or current_user.practitioner?
      flash = "This is the client dashboard. Use this to monitor your own information."
    end

    if !@user.fatsecret_token.nil?

      @days = []

      params['method'] = 'food_entries.get_month'
      params['format'] = 'json'

      begin
        response = Fatsecret::Api.new({}).api_call(
          Rails.application.secrets.fatsecret_consumer_key, 
          Rails.application.secrets.fatsecret_consumer_secret,
          params, 
          @user.fatsecret_token,
          @user.fatsecret_secret
        )

        begin
          puts response.body
          #
          # { "month": { "day": [ {"calories": "705", "carbohydrate": "101.62", "date_int": "16475", "fat": "22.83", "protein": "23.07" }, {"calories": "612", "carbohydrate": "70.59", "date_int": "16479", "fat": "23.85", "protein": "26.06" } ], "from_date_int": "16467", "to_date_int": "16494" }}

          month = ActiveSupport::JSON.decode(response.body)["month"]["day"]
        rescue ActiveSupport::JSON.parse_error
          Rails.logger.warn("Attempted to decode invalid JSON: #{response.body}")
        end

      rescue => e
        logger.warn "Fatsecret failure: #{e}" 
      end

      month.each do |d|

        params['method'] = 'food_entries.get'
        params['format'] = 'json'
        params['date'] = d["date_int"]

        # food_entries.get_month

        begin
          response = Fatsecret::Api.new({}).api_call(
            Rails.application.secrets.fatsecret_consumer_key, 
            Rails.application.secrets.fatsecret_consumer_secret,
            params, 
            @user.fatsecret_token,
            @user.fatsecret_secret
          )

          begin
            #puts response.body
            @days << ActiveSupport::JSON.decode(response.body)["food_entries"]["food_entry"]
          rescue ActiveSupport::JSON.parse_error
            Rails.logger.warn("Attempted to decode invalid JSON: #{response.body}")
          end

        rescue => e
          logger.warn "Fatsecret failure: #{e}" 
        end

      end
    end

  end
end
