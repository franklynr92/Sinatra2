class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :name
      t.string :ingredients
      t.timestamps
    end
  end
end
