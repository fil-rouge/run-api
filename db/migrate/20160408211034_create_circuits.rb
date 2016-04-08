 class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.references :users, index: true#, foreign_key: true
      t.references :points, index: true#, foreign_key: true
      t.integer :distance
      t.integer :note
      t.datetime :date
      t.string :description
      t.datetime :time

      t.timestamps null: false
    end
  end
end
