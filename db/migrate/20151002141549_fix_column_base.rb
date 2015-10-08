class FixColumnBase < ActiveRecord::Migration
  def change
     rename_column :savedposts, :base_id, :post_id
  end
end
