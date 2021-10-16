class CreateInstalls < ActiveRecord::Migration[6.1]
  def change
    create_table :installs do |t|
      t.string :ip_address
      t.string :serial_number
      t.timestamps
    end
  end
end
