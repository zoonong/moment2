class Board < ActiveRecord::Base

# Hashtag M:N Relationship Setting
# board.rb / hashtag.rb
    require 'carrierwave/orm/activerecord'
    mount_uploader :image_url, ImageUploader
    
    # 준홍이의 취중코오딩
    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags

    belongs_to :profile
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments

end
