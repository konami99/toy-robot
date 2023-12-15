class Robot < ApplicationRecord
  has_one :cell

  enum direction: { north: 0, east: 1, south: 2, west: 3 }
end
