class AddTownToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :town, foreign_key: true
  end
end
