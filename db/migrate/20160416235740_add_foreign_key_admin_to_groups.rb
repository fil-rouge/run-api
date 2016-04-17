class AddForeignKeyAdminToGroups < ActiveRecord::Migration
  def change
    add_reference :groups, :admin, references: :users
  end
end
