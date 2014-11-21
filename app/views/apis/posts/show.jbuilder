json.(@post, :id, :title, :body, :open_date, :close_date, :open_time, :close_time,
  :charge, :promoter, :url, :facebook, :twitter, :mail)
json.category(@post.category, :title, :title_ja)
json.pictures do
  json.array! @post.pictures do |picture|
    json.large_url picture.image.url(:mobile_large)
  end
end
