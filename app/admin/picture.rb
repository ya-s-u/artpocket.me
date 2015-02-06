ActiveAdmin.register Picture do
  permit_params :post_id, :priority, :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Picture' do
      f.input :post_id
      f.input :priority
      f.input :image, :required => false, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:resized)) : content_tag(:span, "no image")
    end
    f.actions
  end
end
