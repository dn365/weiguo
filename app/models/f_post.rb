class FPost < ActiveRecord::Base
  mount_uploader :f_image, ImageUploader
  paginates_per 20

  has_many :line_items, :class_name => "LineItem"
  before_destroy :ensure_not_referenced_by_any_line_itme

  validates :title, :desc, :sell_price, :base_price,  presence: {message: "can't be blank"}
  validates :title, uniqueness: {message: "must be unique"}



  private

  def ensure_not_referenced_by_any_line_itme
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Lien Items present')
      return false
    end
  end

end
