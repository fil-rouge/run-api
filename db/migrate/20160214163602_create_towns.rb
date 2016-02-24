class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.references :county, foreign_key: true
      t.string :name
      t.integer :radius
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
