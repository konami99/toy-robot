class Robot < ApplicationRecord
  has_one :cell

  enum direction: [ :north, :east, :south, :west ]

  def turn_right
    update(direction: (Robot.directions[direction] + 1) % 4)
  end

  def turn_left
    update(direction: (Robot.directions[direction] +3) % 4)
  end
end
