class CreateCircuitsPoints < ActiveRecord::Migration
  def change
    create_table :circuits_points do |t|
      t.belongs_to :circuit, index: true
      t.belongs_to :point, index: true
    end
  end
end
