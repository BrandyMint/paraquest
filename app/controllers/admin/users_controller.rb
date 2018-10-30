class Admin::UsersController < Admin::ApplicationController
  def index
    render locals: { users: paginate(User.ordered) }
  end
end
