class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.string :name,         null: false
      t.text   :description
      t.string :handle,       null: false, limit: 50
      t.string :phone_number,              limit: 20
      t.string :email
      t.string :country_code,              limit: 2
      t.string :website
      t.string :profile_image_url
      t.string :background_image_url

      t.timestamps
    end

    add_index :organizations, :handle, unique: true, name: "ix_organizations__handle"
    add_index :organizations, :email, unique: true, name: "ix_organizations__email"
    add_index :organizations, :phone_number, unique: true, name: "ix_organizations__phone_number"
  end
end
