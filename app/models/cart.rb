class Cart < ActiveRecord::Base
  has_many :line_items, :class_name => "LineItem", :dependent => :destroy

  def add_production(production_id,user_id)
    if user_id
      current_item = User.find(user_id).line_items.where(f_post_id:production_id).first
    else
      current_item = line_items.where(f_post_id:production_id).first
    end
    if current_item
      current_item.quantiity += 1
      current_item.user_id = user_id if user_id
    else
      current_item = line_items.build({f_post_id:production_id,user_id:user_id})
    end
    current_item
  end

  # def f_total_price
  #   f_post.sell_price * quantiity
  # end

  # def total_price
  #   sum{|item| item.f_post.sell_price * item.quantiity}
  # end



end
