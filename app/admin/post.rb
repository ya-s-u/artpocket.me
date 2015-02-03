ActiveAdmin.register Post do
  permit_params :title, :body, :category_id, :open_date, :close_date, :open_time, :close_time, :charge, :promoter, :url, :facebook, :twitter, :mail, :place, :place_id
end
