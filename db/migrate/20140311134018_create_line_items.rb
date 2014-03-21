class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :f_post_id
      t.integer :cart_id
      t.integer :user_id

      t.timestamps
    end
  end
end
