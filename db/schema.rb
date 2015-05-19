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

ActiveRecord::Schema.define(version: 20150507195418) do

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "year"
    t.string   "rated"
    t.string   "released"
    t.string   "runtime"
    t.string   "genre"
    t.string   "director"
    t.string   "writer"
    t.text     "actors"
    t.text     "plot"
    t.text     "awards"
    t.string   "poster"
    t.string   "meta_score"
    t.string   "imdb_rating"
    t.string   "imdb_votes"
    t.string   "imdb_ID"
    t.string   "type_"
    t.string   "tomato_meter"
    t.string   "tomato_rating"
    t.string   "tomato_reviews"
    t.string   "tomato_fresh"
    t.string   "tomato_rotten"
    t.text     "tomato_consensus"
    t.string   "tomato_user_meter"
    t.string   "tomato_user_rating"
    t.string   "tomato_user_reviews"
    t.string   "dvd"
    t.string   "box_office"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
