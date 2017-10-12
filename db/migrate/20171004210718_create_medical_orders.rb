class CreateMedicalOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_orders do |t|
      t.belongs_to :health_care
      t.belongs_to :patient
      t.string :doctor_name
      t.timestamps
    end
  end
end
