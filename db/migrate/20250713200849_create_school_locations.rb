class CreateSchoolLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :school_locations do |t|
      t.references :organization, null: false, foreign_key: { to_table: :schools }, index: false
      t.references :school,       null: false, foreign_key: { to_table: :schools }, index: false
      t.references :location,     null: false, foreign_key: { to_table: :locations }, index: false

      t.timestamps
    end

    add_index :school_locations, :organization_id, name: "ix_school_locations__organization_id"
    add_index :school_locations, [ :school_id, :location_id ], unique: true, name: "ix_school_locations__school_id_location_id"
  end
end
