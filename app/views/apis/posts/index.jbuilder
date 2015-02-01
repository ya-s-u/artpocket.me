# Pagenator
json.pagenator do
  json.current_page @posts.current_page
  json.prev !@posts.first_page?
  json.next !@posts.last_page?
end

# Posts
json.posts do
  json.array! @posts do |post|
    json.(post, :id, :title, :open_date, :close_date, :place)
    json.thumbnail_url post.pictures[0].image.url(:mobile_thumb)
  end
end
