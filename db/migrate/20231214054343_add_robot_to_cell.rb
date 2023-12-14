class AddRobotToCell < ActiveRecord::Migration[7.0]
  def change
    add_reference :cells, :robot, null: true, foreign_key: true
  end
end
