class CreateRobot < ActiveRecord::Migration[7.0]
  def change
    create_table :robots do |t|
      #t.references :cell, null: false, foreign_key: true
      t.string :direction, null: false

      t.timestamps
    end
  end
end
