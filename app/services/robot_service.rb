class RobotService
  def self.place(x_pos:, y_pos:, direction:)
    Cell.all.each do |cell|
      cell.update(robot: nil)
    end

    Robot.destroy_all
    robot = Robot.create(direction: direction.downcase)
    cell = Cell.find_by(x: x_pos, y: y_pos)
    cell.update(robot: robot)
  end

  def self.move
    robot = Robot.first
    if robot
      direction = robot.direction
      robot_current_cell = robot.cell

      new_cell = robot_current_cell.send(direction)
      if new_cell
        robot_current_cell.update(robot: nil)
        new_cell.update(robot: robot)
      end
    end
  end

  def self.turn_right
    robot = Robot.first
    robot.turn_right if robot
  end

  def self.turn_left
    robot = Robot.first
    robot.turn_left if robot
  end

  def self.report
    Robot.first
  end
end
