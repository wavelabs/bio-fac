class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :phone
      t.string :address
      t.string :dni
      t.string :cuil
      t.string :cuit

      t.timestamps
    end
  end
end
