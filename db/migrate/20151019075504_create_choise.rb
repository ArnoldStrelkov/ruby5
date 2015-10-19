class CreateChoise < ActiveRecord::Migration
  def change
    create_table :choises do |t|
      t.integer :user_id
      t.boolean :investor
      t.boolean :biginvestor
      t.boolean :commresant
      t.boolean :mentor
      t.boolean :customer
    end
  end
end
