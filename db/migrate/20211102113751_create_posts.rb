class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,      null: false
      t.date :date,         null: false
      t.text :explanation,  null: false
      t.references :cliant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
