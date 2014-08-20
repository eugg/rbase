ActiveAdmin.register Post do

  permit_params :title, :content

  form do |f|
    f.inputs t("active_admin.posts.sample") do
      f.input :title
      f.input :content, as: :wysihtml5
    end
    f.actions
  end
end
