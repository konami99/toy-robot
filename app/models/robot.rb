class Robot < ApplicationRecord
  has_one :cell

  enum direction: [ :north, :east, :south, :west ]
end
