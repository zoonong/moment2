class Profile < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    
    # validates_presence_of :title, :body
    # searchable do
    #    text :title, :body
    #end
    
end
