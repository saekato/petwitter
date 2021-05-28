class Article < ApplicationRecord
    validates :title, presence: true
    #公開非公開のﾓﾃﾞﾙ定義
    enum status: { pubic: 0, private: 1}, _prefix: true
end
