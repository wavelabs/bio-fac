ActiveAdmin.register HealthCaresPatient do
  permit_params :affiliate_no, :health_care_id, :patient_id, :active

  index do
    id_column
    column :affiliate_no
    column :health_care
    column :patient
    column :active
    actions
  end

  filter :affiliate_no
  filter :health_care

  form do |f|
    f.semantic_errors
    f.inputs :patient, :health_care, :affiliate_no, :active
    f.actions
  end
end
