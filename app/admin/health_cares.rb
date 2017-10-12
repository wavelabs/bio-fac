ActiveAdmin.register HealthCare do
  permit_params :code, :name, :description, :address, :phone
end
