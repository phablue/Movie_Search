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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150824195911) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "awards"
    t.string   "box_office"
    t.string   "cast"
    t.string   "country"
    t.string   "director"
    t.string   "dvd"
    t.text     "full_plot"
    t.string   "genre"
    t.string   "image"
    t.string   "imdb_ID",             null: false
    t.string   "imdb_rating"
    t.string   "imdb_votes"
    t.string   "language"
    t.string   "last_updated"
    t.string   "metacritic"
    t.text     "plot"
    t.string   "poster"
    t.string   "production"
    t.string   "rating"
    t.string   "released"
    t.string   "runtime"
    t.string   "title"
    t.text     "tomato_consensus"
    t.string   "tomato_fresh"
    t.string   "tomato_meter"
    t.string   "tomato_rating"
    t.text     "tomato_reviews"
    t.string   "tomato_rotten"
    t.string   "tomato_user_meter"
    t.string   "tomato_user_rating"
    t.text     "tomato_user_reviews"
    t.string   "website"
    t.string   "writer"
    t.string   "year"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
