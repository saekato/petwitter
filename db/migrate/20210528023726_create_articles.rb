class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      #外部ｷｰ（ﾃｰﾌﾞﾙ同士の紐づけ）
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
