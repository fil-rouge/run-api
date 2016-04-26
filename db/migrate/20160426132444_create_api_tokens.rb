class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :token
      t.string :iteration
      t.string :api
    end
  end
end
