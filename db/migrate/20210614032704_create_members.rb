class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false #ユーザー名
      t.string :email, null: false #メールアドレス
      t.integer :sex, null: false, default: 1 #性別 1男2女
      t.integer :department, null: false, default: 0 #学部
      t.boolean :administrator, null: false, default: false #管理者フラグ
      t.timestamps
    end
  end
end
