# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_28_121801) do

  create_table "friend_ships", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "myfriend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_friend_ships_on_creator_id"
    t.index ["myfriend_id"], name: "index_friend_ships_on_myfriend_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "invited_friends", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.string "acceptStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_invited_friends_on_order_id"
    t.index ["user_id"], name: "index_invited_friends_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "body"
    t.bigint "order_id"
    t.integer "not_type"
    t.integer "status"
    t.bigint "sender_id"
    t.bigint "reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_notifications_on_order_id"
    t.index ["reciever_id"], name: "index_notifications_on_reciever_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "meal"
    t.string "restaurant"
    t.string "menuImg"
    t.string "status"
    t.integer "invited"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joined", default: 0
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "amount"
    t.string "item"
    t.integer "price"
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["order_id"], name: "index_user_orders_on_order_id"
    t.index ["user_id"], name: "index_user_orders_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.string "oauth_token"
    t.string "first_name"
    t.string "last_name"
    t.datetime "oauth_expires_at"
    t.string "image", default: "https://www.autourdelacom.fr/wp-content/uploads/2018/03/default-user-image.png"
  end

  add_foreign_key "friend_ships", "users", column: "creator_id"
  add_foreign_key "friend_ships", "users", column: "myfriend_id"
  add_foreign_key "groups", "users"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "invited_friends", "orders"
  add_foreign_key "invited_friends", "users"
  add_foreign_key "notifications", "orders"
  add_foreign_key "notifications", "users", column: "reciever_id"
  add_foreign_key "notifications", "users", column: "sender_id"
  add_foreign_key "orders", "users"
  add_foreign_key "user_orders", "orders"
  add_foreign_key "user_orders", "users"
end
