class Board < ActiveRecord::Base

# Hashtag M:N Relationship Setting
# board.rb / hashtag.rb
    require 'carrierwave/orm/activerecord'
    mount_uploader :image_url, ImageUploader
    
    # validates_presence_of :title, :body
    # searchable do
    #    text :title, :body
    # end
    
    def self.search(query)
        self.where("title || content LIKE ?","%#{query}%")
    end
    
    
    # 준홍이의 취중코오딩 <- 송이가 한거
    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags

    belongs_to :profile
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments

end
