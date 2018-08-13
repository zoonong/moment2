class Board < ActiveRecord::Base
# Hashtag M:N Relationship Setting
# board.rb / hashtag.rb
    belongs_to :category
    
    has_and_belongs_to_many :hashtags
    
    accepts_nested_attributes_for :hashtags
end
