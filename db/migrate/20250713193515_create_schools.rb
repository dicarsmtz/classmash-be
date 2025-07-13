class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.references :organization, null: false, foreign_key: { to_table: :organizations }, index: false
      t.string :name,             null: false
      t.text   :description
      t.string :handle,           null: false, limit: 50
      t.string :phone_number,                  limit: 20
      t.string :email

      t.timestamps
    end

    add_index :schools, :organization_id, name: "ix_schools__organization_id"
    add_index :schools, :handle, name: "ix_schools__handle"
    add_index :schools, :email, name: "ix_schools__email"
    add_index :schools, :phone_number, name: "ix_schools__phone_number"
  end
end
