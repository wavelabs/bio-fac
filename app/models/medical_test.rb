class MedicalTest < ApplicationRecord
  validates :name, presence: true
  validates :unit, presence: true
end
