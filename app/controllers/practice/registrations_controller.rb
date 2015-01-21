class Practice::RegistrationsController < Devise::RegistrationsController

  def new
    profile = 'practitioner'
    if profile && User.roles.include?(profile) && profile != "admin"
      super
    else
      redirect_to root_path, :notice => 'Error signing up'
    end 
  end

  def edit
    super
  end


  private

  def build_resource(*args)
    super
    resource.role = 'practitioner'
  end
end