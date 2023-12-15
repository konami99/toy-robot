class TablesController < ApplicationController
  include Turbo::Streams::ActionHelper

  def index
    
  end

  def place
    x = params[:x]
    y = params[:y]
    direction = params[:direction].downcase
    
    Cell.all.each do |c|
      c.update(robot: nil)
    end

    Robot.destroy_all
    r = Robot.create(direction: direction)
    c = Cell.where(x: x, y: y).first
    c.update(robot: r)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def move
    robot = Robot.first
    if robot
      direction = robot.reload.direction
      robot_current_cell = robot.reload.cell

      new_cell = robot_current_cell.send(direction)
      if new_cell
        robot_current_cell.update(robot: nil)
        new_cell.update(robot: robot)
      end
    end

    respond_to do |format|
      format.turbo_stream
    end
  end
end
