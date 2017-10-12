class MedicalOrder < ApplicationRecord
  belongs_to :patient
  delegate :display_name, :health_cares, to: :patient, prefix: true

  belongs_to :health_care
  delegate :name, to: :health_care, prefix: true

  has_many :comments, ->() { where(resource_type: MedicalOrder) }, class_name: 'ActiveAdmin::Comment', foreign_key: :resource_id, foreign_type: :resource_type
  has_many :medical_order_items, class_name: 'MedicalOrderItem', dependent: :destroy#, inverse_of: :medical_order

  accepts_nested_attributes_for :medical_order_items, reject_if: :all_blank, allow_destroy: true

  def affiliate_no
    patient.affiliate_no_for(health_care)
  end

  def display_name
    "##{id.to_s.rjust(12, '0')} - #{patient.display_name} - #{health_care_name} [#{affiliate_no}]"
  end
end
