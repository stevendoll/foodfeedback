class Practice::ClientsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :invite, :destroy]
  #after_action :verify_authorized

  def index
    authorize :practice_client
    @clients = policy_scope(User)
  end

  def show
    #authorize :practice_client
    #authorize @user

    if !@client.fatsecret_token.nil?

      #params = {"food_id" => "33691", "method" => "food.get"}
      params['method'] = 'food_entries.get'
      params['format'] = 'json'
      params['date'] = '16475'

      # food_entries.get_month
      @body = ""

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
          obj = ActiveSupport::JSON.decode(response.body)
          obj2 = ActiveSupport::JSON.decode(response.body)["food_entries"]["food_entry"] #.map { |food_entry| [food_entry["food_entry_description"]] }
        rescue ActiveSupport::JSON.parse_error
          Rails.logger.warn("Attempted to decode invalid JSON: #{response.body}")
        end

      rescue => e
        logger.warn "Fatsecret failure: #{e}" 
      end


      #day_data = []
      @day_data = obj["food_entries"]["food_entry"]

    end

    

    # p obj

    # p obj2

    

    # obj["food_entries"]["food_entry"].each do |f|
    #   #puts f.first["calcium"]
    #   f.each do |c|

    #     puts c[0]
    #     puts c[1]
    #   #f.each do |c|
    #     #puts c
    #     #puts c.first["calcium"]
    #     #{"calcium"=>"2", "calories"=>"17"
    #     #puts c[:calcium]
    #     # obj2 = ActiveSupport::JSON.decode(c)
    #     # puts obj2["calcium"]
    #     #c.keys
    #   end
    #   # f.each do |key|
    #   #   puts "#{key}" # prints each key and value.
    #   # end
    #   #puts f.keys
    # end

    # puts obj["food_entries"].count #1
    # puts obj["food_entries"]["food_entry"].count #7
    # puts obj["food_entries"]["food_entry"].first.count #22



    #@something = body.month.day.calories
    #@calories = @body[:month][:day][:calories]

    #puts @calories

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