# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_14_054343) do
  create_table "cells", force: :cascade do |t|
    t.integer "order", null: false
    t.integer "x", null: false
    t.integer "y", null: false
    t.integer "north_id"
    t.integer "east_id"
    t.integer "south_id"
    t.integer "west_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "robot_id"
    t.index ["east_id"], name: "index_cells_on_east_id"
    t.index ["north_id"], name: "index_cells_on_north_id"
    t.index ["robot_id"], name: "index_cells_on_robot_id"
    t.index ["south_id"], name: "index_cells_on_south_id"
    t.index ["west_id"], name: "index_cells_on_west_id"
  end

  create_table "robots", force: :cascade do |t|
    t.string "direction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cells", "cells", column: "east_id"
  add_foreign_key "cells", "cells", column: "north_id"
  add_foreign_key "cells", "cells", column: "south_id"
  add_foreign_key "cells", "cells", column: "west_id"
  add_foreign_key "cells", "robots"
end
