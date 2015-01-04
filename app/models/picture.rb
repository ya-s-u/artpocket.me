class Picture < ActiveRecord::Base
  belongs_to :post

  case ENV['RAILS_ENV']
    when "development"
      S3_BUCKET_NAME = 'dev-cdn.artpocket.me'
    when "production"
      S3_BUCKET_NAME = ENV['S3_BUCKET_NAME']
  end

  has_attached_file :image, :styles => {
      :mobile_thumb  => "540x9999>",
      :mobile_large  => "1080x9999>",
      :pc_thumb => "240x9999>",
      :pc_large => "475x9999>"
    },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => S3_BUCKET_NAME,
    :path => "pictures/:style/:id.:extension",
    :url => ":s3_alias_url",
    :s3_host_alias => S3_BUCKET_NAME

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
