class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token
      t.string :salt
      t.integer :user_id
      t.timestamps
    end
    add_index :api_keys, :user_id, unique: true
  end
end
