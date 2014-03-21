class LineItem < ActiveRecord::Base
  belongs_to :f_post, foreign_key: "f_post_id"
  belongs_to :cart
  belongs_to :user


  # def f_total_price
  #   f_post.sell_price * quantiity
  # end
end
