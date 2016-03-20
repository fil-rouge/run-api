class AddParcourToTags < ActiveRecord::Migration
  def change
     add_reference :tags, :parcour, index: true
  end
end
