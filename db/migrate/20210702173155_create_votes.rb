class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :comment, null: false
      t.references :member, null: false
      t.timestamps
    end
  end
end
