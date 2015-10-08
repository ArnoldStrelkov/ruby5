class Renametable < ActiveRecord::Migration
  def change
    rename_table :bases, :posts
  end
end
