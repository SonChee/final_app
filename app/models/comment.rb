class Comment < ActiveRecord::Base
	belongs_to :user, class_name: "User"
	belongs_to :entry, class_name: "Entry"
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 500 }
	validates :user_id, presence: true
	validates :entry_id, presence: true
end
