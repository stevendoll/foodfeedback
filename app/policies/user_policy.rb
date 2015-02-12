class UserPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      case user.role
      when 'admin' 
        scope.all
      when 'practitioner' 
        #scope.all
        scope.where(:account => @user.account)
      else
        #scope.all
        scope.where(:id => @user.id)
      end
    end
  end

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

  # /practice/clients
  def practitioner_dashboard_index?
    @current_user.admin? or @current_user.practitioner?
  end

  # /practice/clients/:id
  def practitioner_dashboard_show?
    @current_user.admin? or (@current_user.practitioner? and @current_user.account == @user.account)
  end


end
