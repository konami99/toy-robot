class Cell < ApplicationRecord
  belongs_to :robot, optional: true
  belongs_to :north, class_name: 'Cell', foreign_key: 'north_id', optional: true
  belongs_to :east, class_name: 'Cell', foreign_key: 'east_id', optional: true
  belongs_to :south, class_name: 'Cell', foreign_key: 'south_id', optional: true
  belongs_to :west, class_name: 'Cell', foreign_key: 'west_id', optional: true
end
