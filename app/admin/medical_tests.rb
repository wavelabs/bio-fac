ActiveAdmin.register MedicalTest do
  permit_params :name, :recomendations, :unit

  index do
    id_column
    column :name
    column :unit
    actions
  end

  filter :name

  form do |f|
    f.semantic_errors
    f.inputs :name, :unit, :recomendations
    f.actions
  end
end
