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
end
