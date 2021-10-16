class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :api_key
      t.timestamps
    end
  end
end
