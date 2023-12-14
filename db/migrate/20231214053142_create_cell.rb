class CreateCell < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer :order, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.references :north, null: true, foreign_key: { to_table: :cells }
      t.references :east, null: true, foreign_key: { to_table: :cells }
      t.references :south, null: true, foreign_key: { to_table: :cells }
      t.references :west, null: true, foreign_key: { to_table: :cells }

      t.timestamps
    end
  end
end
