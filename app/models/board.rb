class Board < ActiveRecord::Base

# Hashtag M:N Relationship Setting
# board.rb / hashtag.rb

    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags

    belongs_to :profile
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments

end
