json.array!(@f_posts) do |f_post|
  json.extract! f_post, :title, :desc, :sell_price, :base_price, :discount, :f_weigth, :add_stat, :detail
  json.url f_post_url(f_post, format: :json)
end
