class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rate
      t.references :mentor, foreign_key: {to_table: :users}
      t.references :mentee, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
