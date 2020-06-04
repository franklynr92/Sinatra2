class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :addresses
      
      t.integer :basket_id
      t.integer :user_id
    
    end
  end
end
