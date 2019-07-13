class UsersController < ApplicationController

  def index
    users = current_user.id
    @nickname = current_user.nickname
  end

  def show
    
  end

  def edit

  end
end
