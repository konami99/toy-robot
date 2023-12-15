class TablesController < ApplicationController
  include Turbo::Streams::ActionHelper

  def index
    
  end

  def place
    RobotService.place(
      x_pos: params[:x],
      y_pos: params[:y],
      direction: params[:direction]
    )

    respond_to do |format|
      format.turbo_stream
    end
  end

  def move
    RobotService.move

    respond_to do |format|
      format.turbo_stream
    end
  end

  def turn_right
    RobotService.turn_right

    respond_to do |format|
      format.turbo_stream
    end
  end

  def turn_left
    RobotService.turn_left

    respond_to do |format|
      format.turbo_stream
    end
  end

  def report
    @robot = RobotService.report
  end
end
