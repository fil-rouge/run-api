 class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.integer :distance
      t.integer :note
      t.datetime :date
      t.string :description
      t.integer :time
      t.timestamps null: false
    end
  end
end
