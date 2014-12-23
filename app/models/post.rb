class Post < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  belongs_to :category
end
