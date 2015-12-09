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

ActiveRecord::Schema.define(version: 20151205041804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.string   "adress"
    t.string   "cardtype"
    t.string   "last4digit"
    t.datetime "expdate"
    t.string   "phone"
    t.string   "name"
    t.string   "fullnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospedajes", force: :cascade do |t|
    t.string   "titulo"
    t.string   "lugar"
    t.date     "fecha"
    t.string   "foto"
    t.boolean  "disponible"
    t.integer  "capacidad"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "tipo_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospedaje_id"
    t.datetime "fecha"
    t.boolean  "aceptado"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "disponible"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "premium",           default: false
    t.string   "credit_card"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
