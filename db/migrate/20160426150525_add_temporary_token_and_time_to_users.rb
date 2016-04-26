class AddTemporaryTokenAndTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temporary_token, :string, null: false, default: ""
    add_column :users, :previous_temporary_token_date, :datetime, null: false, default: DateTime.now
  end
end
