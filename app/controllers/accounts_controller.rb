class AccountsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    authorize Account
    @accounts = policy_scope(Account)
    respond_with(@accounts)
  end

  def show
    authorize @account
    respond_with(@account)
  end

  def new
    @account = Account.new
    authorize @account
    respond_with(@account)
  end

  def edit
    authorize @account
  end

  def create
    @account = Account.new(account_params)
    authorize @account
    @account.save
    respond_with(@account)
  end

  def update
    authorize @account
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    authorize @account
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :creator_id)
    end
end
