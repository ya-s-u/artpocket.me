class Picture < ActiveRecord::Base
  belongs_to :posts

  has_attached_file :image, :styles => {
      :thumb  => "100x100>",
      :medium => "200x200>",
      :large => "600x400>"
    },
    :storage => :s3,
    :s3_permissions => :private,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":pictures/:style/:id.:extension"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def authenticated_image_url(style)
    image.s3_object(style).url_for(:read, :secure => true)
  end

end
