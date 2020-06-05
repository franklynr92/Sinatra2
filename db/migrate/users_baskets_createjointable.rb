class Createjointable < ActiveRecord::Migration
  def change
    def change
      create_join_table :users, :baskets  do |t|
        t.string :name
        t.string :addresses
        #do i have to create a nother table to make a join table
        t.integer :basket_id
        t.integer :user_id
        
    
      end
  end
end
