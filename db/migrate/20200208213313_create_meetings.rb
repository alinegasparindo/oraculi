class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.boolean :accepted
      t.references :mentor, foreign_key: {to_table: :users}
      t.references :mentee, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
