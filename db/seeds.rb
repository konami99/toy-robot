# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cell0 = Cell.create(order: 0, x: 0, y: 4)
cell1 = Cell.create(order: 1, x: 1, y: 4)
cell2 = Cell.create(order: 2, x: 2, y: 4)
cell3 = Cell.create(order: 3, x: 3, y: 4)
cell4 = Cell.create(order: 4, x: 4, y: 4)

cell5 = Cell.create(order: 5, x: 0, y: 3)
cell6 = Cell.create(order: 6, x: 1, y: 3)
cell7 = Cell.create(order: 7, x: 2, y: 3)
cell8 = Cell.create(order: 8, x: 3, y: 3)
cell9 = Cell.create(order: 9, x: 4, y: 3)

cell10 = Cell.create(order: 10, x: 0, y: 2)
cell11 = Cell.create(order: 11, x: 1, y: 2)
cell12 = Cell.create(order: 12, x: 2, y: 2)
cell13 = Cell.create(order: 13, x: 3, y: 2)
cell14 = Cell.create(order: 14, x: 4, y: 2)

cell15 = Cell.create(order: 15, x: 0, y: 1)
cell16 = Cell.create(order: 16, x: 1, y: 1)
cell17 = Cell.create(order: 17, x: 2, y: 1)
cell18 = Cell.create(order: 18, x: 3, y: 1)
cell19 = Cell.create(order: 19, x: 4, y: 1)

cell20 = Cell.create(order: 20, x: 0, y: 0)
cell21 = Cell.create(order: 21, x: 1, y: 0)
cell22 = Cell.create(order: 22, x: 2, y: 0)
cell23 = Cell.create(order: 23, x: 3, y: 0)
cell24 = Cell.create(order: 24, x: 4, y: 0)

cell0.update(east: cell1, south: cell5)
cell1.update(west: cell0, east: cell2, south: cell6)
cell2.update(west: cell1, east: cell3, south: cell7)
cell3.update(west: cell2, east: cell4, south: cell8)
cell4.update(west: cell3, south: cell9)

cell5.update(south: cell10, east: cell6)
cell6.update(west: cell5, east: cell7, south: cell11)
cell7.update(west: cell6, east: cell8, south: cell12)
cell8.update(west: cell7, east: cell9, south: cell13)
cell9.update(west: cell8, south: cell14)