class Post < ActiveRecord::Base
# Hashtag M:N Relationship Setting
# post.rb / hashtag.rb
    has_and_belongs_to_many :hashtags
    
    accepts_nested_attributes_for :hashtags
end
