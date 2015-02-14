class Practice::ClientsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :invite, :destroy]
  after_action :verify_authorized

  def index
    authorize User, :practitioner_dashboard_index?
    @clients = policy_scope(User)
  end

  def show
    #authorize :practice_client
    @user = @client
    authorize @user, :practitioner_dashboard_show?

    if !@client.fatsecret_token.nil?

      @days = []

      params['method'] = 'food_entries.get_month'
      params['format'] = 'json'
      #params['date'] = '16475'

      # food_entries.get_month

      begin
        response = Fatsecret::Api.new({}).api_call(
          Rails.application.secrets.fatsecret_consumer_key, 
          Rails.application.secrets.fatsecret_consumer_secret,
          params, 
          @client.fatsecret_token,
          @client.fatsecret_secret
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
            @client.fatsecret_token,
            @client.fatsecret_secret
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

  # GET /clients/1/edit
  def edit
    authorize :practice_client
  end

  def update
    authorize :practice_client
    if @client.update_attributes(secure_params)
      redirect_to practice_clients_path, :notice => "User updated."
    else
      redirect_to practice_clients_path, :alert => "Unable to update client."
    end
  end

  def destroy
    authorize :practice_client
    @client.destroy
    redirect_to practice_clients_path, :notice => "User deleted."
  end

  private

  def set_client
    @client = User.find(params[:id])
  end

  def secure_params
    params.require(:client).permit(:role, :name, :email, :authentication_token, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone, :description, :avatar, :invitation_code, :tag_list, :account_id)
  end

end