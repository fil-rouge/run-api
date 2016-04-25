class AddNbRunAndTitleToCircuits < ActiveRecord::Migration
  def change
    add_column :circuits, :nbRun, :integer, default: 1
    add_column :circuits, :title, :string, default: "Mon circuit"
  end
end
