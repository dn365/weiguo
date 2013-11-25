class UsersController < ApplicationController
  before_filter :load_user_show
    
  
  
  def load_user_show
    @user_show = "dfsdf"
  end
  
end
