class AddAuthentificationTokenToUsers < ActiveRecord::Migration
  def change
    # t.string :authentication_token, null: false, default: ""
    add_column :users, :authentication_token, :string, null: false, default: ""
  end
end
