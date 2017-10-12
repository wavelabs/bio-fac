ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Ultimos Pacientes" do
          ul do
            Patient.last(5).map do |patient|
              li link_to(patient.display_name, [:admin, patient])
            end
          end
        end
      end

      column do
        panel "Ultimas Ordenes Realizadas" do
          ul do
            MedicalOrder.last(5).map do |mo|
              li link_to(mo.display_name, [:admin, mo])
            end
          end
        end
      end
    end
  end # content
end
