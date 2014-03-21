class SiteController < ApplicationController
  before_filter :load_cart

  def index
    @site_index = true
    @posts = FPost.where(add_stat:true).order("created_at DESC")
  end


end
