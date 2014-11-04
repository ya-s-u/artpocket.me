class Picture < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image, :styles => {
      :mobile_thumb  => "540x9999>",
      :mobile_large  => "1080x9999>",
      :pc_thumb => "240x9999>",
      :pc_large => "475x9999>"
    },
    :storage => :s3,
    :s3_permissions => :private,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "pictures/:style/:id.:extension"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def authenticated_image_url(style)
    image.s3_object(style).url_for(:read, :secure => true)
  end

end
