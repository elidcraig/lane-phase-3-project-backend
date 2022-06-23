class AddLoggedInToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :logged_in, :boolean
  end
end
