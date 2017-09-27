class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 100
      t.string :email, null: false, unique: true, limit: 100
      t.string :password_digest, null: false
      t.boolean :admin, default: false
      t.string :username, null: false, unique: true, limit: 50
      t.boolean :rememberme, default: false

      t.timestamps
    end
  end
end
