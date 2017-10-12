ActiveAdmin.register MedicalOrder do
  permit_params :patient_id, :health_care_id, :doctor_name, medical_order_items_attributes: [:id, :medical_test_id, :value, :_destroy]

  member_action :preview, method: :post do
    respond_to do |format|
      format.pdf do
        render pdf: I18n.t('.filename'),
               encoding: 'UTF-8',
               header: {
                right: "Órden no: ##{resource.id.to_s.rjust(12, '0')}",
                left: "Bioquímica Maria Fatima Perez"
               }
      end
    end
  end

  action_item :preview, only: :show do
    link_to I18n.t('.preview'), preview_admin_medical_order_path(resource, format: 'pdf'), target: '_blank', method: :post
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :patient
      f.input :health_care,
        collection: f.object.patient ? f.object.patient_health_cares : [],
        hint: "Número de Afiliado: <span id='affiliate_no'>#{f.object.patient ? f.object.affiliate_no : ''}</span>".html_safe
      f.input :doctor_name
    end
    f.has_many :medical_order_items do |t|
      t.input :id, as: :hidden
      t.inputs :medical_test, :value
      t.input :_destroy, as: :boolean
    end
    f.actions
  end

  show do
    attributes_table do
      row :health_care
      row :patient
      row :doctor_name
    end

    panel 'Analisis Clínicos Realizados' do
      table_for resource.medical_order_items do
        column :medical_test
        column(:value) { |o| o.display_value }
        column :recomendations
      end
    end

    active_admin_comments
  end
end
