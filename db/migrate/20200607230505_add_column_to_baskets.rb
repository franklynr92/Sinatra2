class AddColumnToBaskets < ActiveRecord::Migration
  def change
    add_column :baskets, :user_id, :integer
  end
end
