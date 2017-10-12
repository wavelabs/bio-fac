class CreateMedicalTests < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_tests do |t|
      t.string :name
      t.text :recomendations

      t.timestamps
    end
  end
end
