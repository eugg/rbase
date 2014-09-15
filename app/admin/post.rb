ActiveAdmin.register Post do
  permit_params :title, :content

  form do |f|
    f.inputs t("active_admin.jobs.job_info") do
      f.input :title
      f.input :content, input_html: { class: "redactor" }
    end
    f.actions
  end
end
