json.response do
  json.Posts do
    json.array! @posts do |post|
      json.(post, :id, :title, :body, :open_date, :close_date, :place)
      json.thumbnail_url post.pictures[0].image.url(:mobile_thumb)
    end
  end
end
