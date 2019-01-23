class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :comment
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
