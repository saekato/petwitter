class Article < ApplicationRecord
    validates :title, presence: true
    #userﾃｰﾌﾞﾙに所属
    belongs_to :user
    #公開非公開のﾓﾃﾞﾙ定義
    enum status: { public: 0, private: 1}, _prefix: true
    
    mount_uploader :image, ImageUploader
end
