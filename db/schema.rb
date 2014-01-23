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

ActiveRecord::Schema.define(version: 20140122232847) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "listas", force: true do |t|
    t.string   "nome"
    t.string   "presenteados"
    t.text     "descricao"
    t.string   "foto"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dt_fechamento"
    t.boolean  "publicada"
  end

  add_index "listas", ["user_id"], name: "index_listas_on_user_id"

  create_table "mensagens", force: true do |t|
    t.string   "remetente"
    t.text     "texto"
    t.boolean  "aprovada"
    t.integer  "presente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mensagens", ["presente_id"], name: "index_mensagens_on_presente_id"

  create_table "presentes", force: true do |t|
    t.string   "nome"
    t.decimal  "valor",      precision: 17, scale: 2
    t.string   "foto"
    t.text     "url"
    t.integer  "lista_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentes", ["lista_id"], name: "index_presentes_on_lista_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
