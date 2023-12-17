# Toy Robot
Implemented in Rails and Hotwire.

For the rules of the game, see `toy_robot.md`.

How the game runs:

https://github.com/konami99/toy-robot-dash/assets/166879/db1e8fda-01c9-4a5e-8b8b-d60ba0cdec64

# Setup

```
bundle install
rails db:seed # creating cells and building the relationships between them
rails tailwindcss:build
rails s
```
and visit localhost:3000

# Tests
```
rspec
```

# Data Structure
There are two models in this app, `Robot` and `Cell`. The table contains 25 cells.

Each cell has x-coordinate and y-coordinate.

The left-bottom cell is (0, 0).

Each cell also has references to its surrounding cells: `north`, `east`, `south` and `west`.

When a robot is on a cell, a reference will be created to link the robot to the cell (`cell.robot`).

A robot has a `direction`, when robot is moving, turning left or right, we use `direction` to determine the next cell the robot will be on.

You can use a SQLite client https://sqlitebrowser.org/ to see how the data is stored.
