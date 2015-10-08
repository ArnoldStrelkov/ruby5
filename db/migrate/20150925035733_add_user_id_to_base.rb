class AddUserIdToBase < ActiveRecord::Migration
  def change
    add_column :bases, :user_id, :integer
  end
end
