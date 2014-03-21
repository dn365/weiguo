class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  private
  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      admin_url
    else
      if @cart = current_cart
        @cart.line_items.update_all({user_id:current_user})

        # current_user.line_items.line_items.select("f_post_id, sum(quantiity) as quantiity").group(:f_post_id)
      else
        root_url
      end
    end
  end

  def admin_manage
    unless current_user.has_role? :admin
      redirect_to root_url, notice: "Can't found!"
    end
  end


  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def load_cart
    if current_user
      @cart = current_user.line_items.select("f_post_id, sum(quantiity) as quantiity").group(:f_post_id)
    else
      @cart = current_cart.line_items
    end

  end



end
