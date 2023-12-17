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

cell5.update(south: cell10, east: cell6, north: cell0)
cell6.update(west: cell5, east: cell7, south: cell11, north: cell1)
cell7.update(west: cell6, east: cell8, south: cell12, north: cell2)
cell8.update(west: cell7, east: cell9, south: cell13, north: cell3)
cell9.update(west: cell8, south: cell14, north: cell4)

cell10.update(south: cell15, east: cell11, north: cell5)
cell11.update(west: cell10, east: cell12, south: cell16, north: cell6)
cell12.update(west: cell11, east: cell13, south: cell17, north: cell7)
cell13.update(west: cell12, east: cell14, south: cell18, north: cell8)
cell14.update(west: cell13, south: cell19, north: cell9)

cell15.update(south: cell20, east: cell16, north: cell10)
cell16.update(west: cell15, east: cell17, south: cell21, north: cell11)
cell17.update(west: cell16, east: cell18, south: cell22, north: cell12)
cell18.update(west: cell17, east: cell19, south: cell23, north: cell13)
cell19.update(west: cell18, south: cell24, north: cell14)

cell20.update(east: cell21, north: cell15)
cell21.update(west: cell20, east: cell22, north: cell16)
cell22.update(west: cell21, east: cell23, north: cell17)
cell23.update(west: cell22, east: cell24, north: cell18)
cell24.update(west: cell23, north: cell19)