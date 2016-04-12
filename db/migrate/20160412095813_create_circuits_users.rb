class CreateCircuitsUsers < ActiveRecord::Migration
  def change
    create_table :circuits_users do |t|
      t.belongs_to :circuit, index: true
      t.belongs_to :user, index: true
    end
  end
end
