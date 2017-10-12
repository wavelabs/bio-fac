class CreateMedicalOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_order_items do |t|
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
