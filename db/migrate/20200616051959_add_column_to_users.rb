class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :baskets_id, :integer
  end
end
