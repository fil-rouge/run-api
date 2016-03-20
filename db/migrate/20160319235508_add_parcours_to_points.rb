class AddParcoursToPoints < ActiveRecord::Migration
  def change
    add_reference :points, :parcour, index: true
  end
end
