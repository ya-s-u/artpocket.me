class Category < ActiveRecord::Base
  has_many :post
end
