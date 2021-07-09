class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :name, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
