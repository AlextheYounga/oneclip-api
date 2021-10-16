class CreateClipboardsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :clipboards do |t|
      t.references :user, index: true, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
