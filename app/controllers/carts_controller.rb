class CartsController < ApplicationController
  before_filter :load_cart, only:[:show]

  def create
    @cart = current_cart
    @user = current_user
    user_id = @user ? @user.id : nil
    product = FPost.find(params[:f_post_id])
    # if @user
    # @line_item = @cart.line_items.build(:f_post => product,:user => @user)
    @line_item = @cart.add_production(product.id,user_id)
    respond_to do |format|
      if product and @line_item.save
        total = @user ? @user.line_items.sum(:quantiity) : @cart.line_items.sum(:quantiity)
        format.json {render json: {total: total,status:201}}
      else
        format.json {render json: @line_item.errors,status:405}
      end
    end
  end


  def show
    @total_price = @cart.to_a.sum{|item| item.f_post.sell_price * item.quantiity}
  end

  def update
  end

  # private


end
