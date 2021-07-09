class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false #タイトル
      t.string :editor, null: false
      t.timestamps
    end
  end
end
