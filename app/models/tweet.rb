class Tweet < ApplicationRecord
    belongs_to :user 
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    
    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "image", "updated_at", "user_id"]
    end
    
    has_one_attached :photo #actove storageを使った画像投稿

end
