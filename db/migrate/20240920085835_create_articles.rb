class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :article_number
      t.string :article_text
      t.decimal :weight

      t.timestamps
    end
  end
end
