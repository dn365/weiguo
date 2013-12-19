class FPost < ActiveRecord::Base
  mount_uploader :f_image, ImageUploader
  paginates_per 20
  
  validates :title, :desc, :sell_price, :base_price,  presence: {message: "can't be blank"}
  validates :title, uniqueness: {message: "must be unique"}
  
  
end
