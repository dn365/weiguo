class AdminController < ApplicationController
  before_filter :authenticate_user!, :admin_manage
  def index
  end
end
