class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.integer  :age
      t.integer  :gender

      t.timestamps null: false
    end
  end
end
