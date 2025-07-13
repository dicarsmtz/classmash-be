class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name,   limit: 50, null: false
      t.string :last_name,    limit: 50, null: false
      t.string :display_name, limit: 100
      t.date   :date_of_birth
      t.string :handle,       limit: 30, null: false
      t.string :phone_number, limit: 20
      t.string :email,                   null: false
      t.string :password,     limit: 60, null: false
      t.string :country_code, limit: 2
      t.string :locale,       limit: 5
      t.string :currency,     limit: 3
      t.string :profile_image_url

      t.timestamps
    end

    add_index :users, :phone_number, unique: true, name: "ix_users__phone_number"
    add_index :users, :handle, unique: true, name: "ix_users__handle"
    add_index :users, :email, unique: true, name: "ix_users__email"
  end
end
