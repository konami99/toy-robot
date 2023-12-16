require 'rails_helper'

describe RobotService do
  describe 'self.reset' do
    it 'removes Robot and resets cells' do
      robot = Robot.create(direction: 'east')
      cell = Cell.create(x: 1, y: 1, order: 1)
      cell.update(robot: robot)

      expect(Robot.all.count).to be 1
      RobotService.reset
      expect(Robot.all.count).to be 0
      expect(cell.reload.robot).to be nil
    end
  end

  describe 'self.place' do
    describe 'when cell exists' do
      it 'places the robot on a cell' do
        cell1 = Cell.create(x: 1, y: 1, order: 1, robot: nil)
        cell2 = Cell.create(x: 2, y: 2, order: 2, robot: nil)

        RobotService.place(x_pos: 2, y_pos: 2, direction: 'north')

        expect(cell2.reload.robot).to be_an_instance_of Robot
      end
    end

    describe 'when cell does not exist' do
      it 'places the robot on a cell' do
        cell1 = Cell.create(x: 1, y: 1, order: 1, robot: nil)
        cell2 = Cell.create(x: 2, y: 2, order: 2, robot: nil)

        RobotService.place(x_pos: 999, y_pos: 999, direction: 'north')

        expect(cell1.reload.robot).to be nil
        expect(cell2.reload.robot).to be nil
        expect(Robot.all.count).to be 0
      end
    end
  end

  describe 'self.move' do
    describe 'when new cell exists' do
      it 'moves robot' do
        robot = Robot.create(direction: 'east')

        cell_east = Cell.create(x: 2, y: 2, order: 2)
        cell = Cell.create(x: 1, y: 1, order: 1, robot: robot, east: cell_east)
      
        RobotService.move

        expect(cell_east.reload.robot).to be_an_instance_of Robot
        expect(cell.reload.robot).to be nil
      end
    end

    describe 'when new cell does not exist' do
      it 'does not move robot' do
        robot = Robot.create(direction: 'west')

        cell_east = Cell.create(x: 2, y: 2, order: 2)
        cell = Cell.create(x: 1, y: 1, order: 1, robot: robot, west: nil, east: cell_east)
      
        RobotService.move

        expect(cell_east.reload.robot).to be nil
        expect(cell.reload.robot).to eq robot
      end
    end
  end

  describe 'self.turn_right' do
    it 'turns robot right' do
      robot = Robot.create(direction: 'west')

      RobotService.turn_right
      expect(robot.reload.direction).to eq 'north'

      RobotService.turn_right
      expect(robot.reload.direction).to eq 'east'
    end
  end

  describe 'self.turn_left' do
    it 'turns robot right' do
      robot = Robot.create(direction: 'west')

      RobotService.turn_left
      expect(robot.reload.direction).to eq 'south'

      RobotService.turn_left
      expect(robot.reload.direction).to eq 'east'
    end
  end
end