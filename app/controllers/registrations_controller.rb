class RegistrationsController < Devise::RegistrationsController

  def new
    @plan = params[:plan]
    if @plan && User.roles.include?(@plan) && @plan != "admin"
      super
    else
      redirect_to root_path, :notice => 'Please select a subscription plan below'
    end 
  end

  private

  def build_resource(*args)
    super
    if params[:plan]
      resource.role = params[:plan]
    end
  end
end