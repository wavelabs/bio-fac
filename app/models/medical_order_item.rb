class MedicalOrderItem < ApplicationRecord
  belongs_to :medical_order
  belongs_to :medical_test

  delegate :recomendations, to: :medical_test
  delegate :name, to: :medical_test, prefix: true

  def display_value
    "#{value} [#{medical_test.unit}]"
  end
end
