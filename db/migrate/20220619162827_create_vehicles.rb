class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :image_url
      t.text :description
      t.integer :price_per_day
      t.integer :host_id
    end
  end
end
