class CreateFPosts < ActiveRecord::Migration
  def change
    create_table :f_posts do |t|
      t.string :title
      t.string :desc, limit: 120
      t.decimal :sell_price, precision: 8, scale: 2
      t.decimal :base_price, precision: 8, scale: 2
      t.decimal :discount, precision: 3, scale: 1
      t.integer :f_weigth
      t.boolean :add_stat
      t.text :detail

      t.timestamps
    end
    add_index :f_posts, :title, :unique => true
  end
end
