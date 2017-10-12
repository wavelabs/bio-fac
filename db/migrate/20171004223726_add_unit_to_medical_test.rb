class AddUnitToMedicalTest < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_tests, :unit, :string
  end
end
