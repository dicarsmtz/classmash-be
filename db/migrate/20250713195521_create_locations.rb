class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.references :organization, null: false, foreign_key: { to_table: :organizations }, index: false
      t.string :name
      t.text   :description
      t.string :handle,           null: false, limit: 50
      t.string :phone_number,                  limit: 20
      t.string :email

      t.timestamps
    end

    add_index :locations, :organization_id, name: "ix_locations__organization_id"
    add_index :locations, :handle, name: "ix_locations__handle"
    add_index :locations, :email, name: "ix_locations__email"
    add_index :locations, :phone_number, name: "ix_locations__phone_number"
  end
end
