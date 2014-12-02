class Micropost < ActiveRecord::Base
  	belongs_to :user
  	has_many :comments, dependent: :destroy
  	default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true
  	validates :content, presence: true, length: { maximum: 10000 }
  	validates :title, presence: true, length: { maximum: 100 }
end
