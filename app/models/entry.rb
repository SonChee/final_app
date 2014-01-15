class Entry < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :body, presence: true, length: { maximum: 1000 }
	validates :title, presence: true, length: { maximum: 50 }
	validates :user_id, presence: true
end
