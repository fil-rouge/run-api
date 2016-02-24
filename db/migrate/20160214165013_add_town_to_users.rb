class AddTownToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :town, foreign_key: true
  end
end
