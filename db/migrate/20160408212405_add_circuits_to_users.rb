class AddCircuitsToUsers < ActiveRecord::Migration
  def change
      add_reference :users, :circuits, index: true
  end
end
