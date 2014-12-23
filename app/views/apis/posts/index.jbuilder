json.array! @posts do |post|
  json.(post, :id, :title, :body, :open_date, :close_date, :place)
  json.category(post.category, :title, :title_ja)
  json.thumbnail_url post.pictures[0].image.url(:mobile_thumb)
end
