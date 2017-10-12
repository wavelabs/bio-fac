ActiveAdmin.register Patient do
  permit_params :first_name, :last_name, :surname, :phone, :address, :dni, :cuil,
                :cuit, health_cares_patients_attributes: [
                  :health_care_id, :affiliate_no, :active
                ]

  index do
    id_column
    column :display_name
    column :active_health_care
    column :dni
    column :cuit
    column :cuil
    column(:created_at) { |p| p.created_at.strftime('%B %d, %Y') }
    actions
  end

  filter :health_cares
  filter :surname
  filter :first_name
  filter :last_name
  filter :dni
  filter :cuit
  filter :cuil

  form do |f|
    tabs do
      tab 'Básico' do
        f.inputs :first_name, :last_name, :surname, :dni, :cuil, :cuit, :created_at
        f.inputs 'Afiliaciones' do
          f.semantic_fields_for :health_cares_patients, f.object.health_cares_patients.build, heading: 'Afiliaciones' do |af|
            af.inputs :health_care, :affiliate_no, :active
          end
        end
      end
      tab 'Extras' do
        f.inputs :address, :phone
      end
    end
    f.actions
  end
end
