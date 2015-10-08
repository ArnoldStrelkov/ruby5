class AddHeaderPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :header, :string
    add_column :posts, :picture, :string
  end
end
