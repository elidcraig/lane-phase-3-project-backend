class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :username
      t.string :profile_image_url
    end
  end
end
