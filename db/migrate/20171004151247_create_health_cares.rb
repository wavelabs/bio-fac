class CreateHealthCares < ActiveRecord::Migration[5.0]
  def change
    create_table :health_cares do |t|
      t.string :code
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
