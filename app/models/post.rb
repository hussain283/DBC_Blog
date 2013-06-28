class Post < ActiveRecord::Base
  validates :title, :content, :presence => true
  has_and_belongs_to_many :tags
end
