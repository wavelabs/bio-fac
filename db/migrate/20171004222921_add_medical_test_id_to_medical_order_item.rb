class AddMedicalTestIdToMedicalOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_order_items, :medical_test_id, :integer
  end
end
