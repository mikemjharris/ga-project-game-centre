# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140501155406) do

  create_table "homes", :force => true do |t|
    t.string   "games"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "to_user_id"
    t.integer  "to_user"
    t.string   "title"
    t.text     "message"
    t.string   "type"
    t.boolean  "read"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moves", :force => true do |t|
    t.integer  "ttt_id"
    t.integer  "player"
    t.integer  "player_move"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "numbs", :force => true do |t|
    t.integer  "s1"
    t.integer  "s2"
    t.integer  "s3"
    t.integer  "s4"
    t.integer  "s5"
    t.integer  "s6"
    t.integer  "s7"
    t.integer  "s8"
    t.integer  "s9"
    t.integer  "s10"
    t.integer  "s11"
    t.integer  "s12"
    t.integer  "s13"
    t.integer  "s14"
    t.integer  "s15"
    t.integer  "s16"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "score"
  end

  create_table "ttts", :force => true do |t|
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.integer  "player_one"
    t.integer  "player_two"
    t.integer  "computer"
    t.integer  "player_one_position"
    t.integer  "player_two_position"
    t.boolean  "live_game"
    t.integer  "winner"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "next_player"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
    t.integer  "scheme"
  end

end
