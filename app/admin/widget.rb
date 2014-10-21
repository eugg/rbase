ActiveAdmin.register Widget do
  permit_params :title, :content, :link, :widget_type, :order

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :widget_type, as: :select, collection: Widget.widget_types.keys
      f.input :link
      f.input :order
    end
    f.actions
  end
end
