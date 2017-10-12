class RenameOrderColumntInMedicalOrderItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :medical_order_items, :order_id, :medical_order_id
  end
end
