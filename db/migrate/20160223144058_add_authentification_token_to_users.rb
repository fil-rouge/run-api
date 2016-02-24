class AddAuthentificationTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    # t.string :authentication_token, null: false, default: ""
    add_column :users, :authentication_token, :string, null: false, default: ""
  end
end
