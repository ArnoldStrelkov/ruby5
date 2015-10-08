class CreateSavedposts < ActiveRecord::Migration
  def change
    create_table :savedposts do |t|
      t.integer :base_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
