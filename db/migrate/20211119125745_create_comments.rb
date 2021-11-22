class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,          null: false
      t.integer :trainer_id, foreign_key: true
      t.integer :cliant_id,  foreign_key: true
      t.integer :post_id,    foreign_key: true
      t.timestamps
    end
  end
end
