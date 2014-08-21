ActiveAdmin.register Post do

  permit_params :title, :content

  form do |f|
    f.inputs t("active_admin.posts.sample") do
      f.input :title
      f.input :content, as: :html_editor
    end
    f.actions
  end
end
