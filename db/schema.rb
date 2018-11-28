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

ActiveRecord::Schema.define(version: 20181128131019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "nomUsuario"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "auctions", force: :cascade do |t|
    t.float "precioBase"
    t.float "precioActual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_id"
  end

  create_table "bids", force: :cascade do |t|
    t.float "valor"
    t.time "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "auction_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.bigint "dni"
    t.date "fechaNac"
    t.string "mail"
    t.string "password"
    t.date "fechaReg"
    t.integer "creditos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado"
    t.string "marcaTarj"
    t.bigint "numTarj"
    t.date "fechaVencTarj"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "estado"
    t.string "marcaTarj"
    t.integer "numTarj"
    t.date "fechaVencTarj"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "direccion"
    t.string "localidad"
    t.string "provincia"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.float "precio"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fechaInicio"
    t.date "fechaFin"
    t.integer "client_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "urlImag"
    t.float "precio"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pais"
    t.string "provincia"
    t.string "localidad"
    t.string "direccion"
  end

  create_table "weeks", force: :cascade do |t|
    t.date "inicio"
    t.date "fin"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "residence_id"
    t.integer "preciohs"
  end

end
