class AccountPolicy
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
        false
        #scope.all
        #scope.where(:user => current_user)
      end
    end
  end

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @account = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin?
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
end
