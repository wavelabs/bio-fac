class AddValueToMedicalOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_order_items, :value, :string
  end
end
