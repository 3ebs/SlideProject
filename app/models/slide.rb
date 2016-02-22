class Slide < ActiveRecord::Base
        belongs_to :user
        belongs_to :upload
        has_many :comments
  acts_as_commentable
end
