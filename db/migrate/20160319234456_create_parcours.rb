class CreateParcours < ActiveRecord::Migration
  def change
    create_table :parcours do |t|
      t.float :distance
      t.datetime :dateDebut
      t.datetime :dateFin
      t.integer :note
      t.references :user

      t.timestamps null: false
    end
  end
end
