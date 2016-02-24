class CreateCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.references :area, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
