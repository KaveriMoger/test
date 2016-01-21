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

ActiveRecord::Schema.define(version: 20160107074328) do

  create_table "clients", force: true do |t|
    t.string   "c_name"
    t.string   "c_email"
    t.string   "c_website"
    t.string   "c_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_documents", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "document_id"
  end

  create_table "clients_teams", id: false, force: true do |t|
    t.integer "client_id"
    t.integer "team_id"
  end

  create_table "documents", force: true do |t|
    t.string   "dname"
    t.string   "dauthor"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_path"
    t.string   "team_name"
    t.integer  "client_id"
    t.integer  "team_id"
    t.string   "file_name"
    t.string   "search"
    t.string   "image_name"
  end

  create_table "installs", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",   limit: 128, default: "", null: false
    t.string   "password_salt",                    default: "", null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installs", ["confirmation_token"], name: "index_installs_on_confirmation_token", unique: true
  add_index "installs", ["email"], name: "index_installs_on_email", unique: true
  add_index "installs", ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true

  create_table "role_auths", force: true do |t|
    t.string   "role_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "team_name"
    t.string   "team_head"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_auths", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "password_digest"
    t.integer  "role_id"
  end

end
