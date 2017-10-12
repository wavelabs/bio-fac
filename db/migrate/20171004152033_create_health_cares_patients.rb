class CreateHealthCaresPatients < ActiveRecord::Migration[5.0]
  def change
    create_table :health_cares_patients do |t|
      t.string :affiliate_no
      t.belongs_to :health_care
      t.belongs_to :patient
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
