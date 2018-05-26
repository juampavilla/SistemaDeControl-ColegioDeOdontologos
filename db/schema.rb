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

ActiveRecord::Schema.define(version: 20180526220050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "domicilios", id: :serial, force: :cascade do |t|
    t.string "cp"
    t.string "localidad"
    t.string "domicilio"
    t.string "telefono"
    t.string "tipo"
    t.text "notas"
    t.integer "profesional_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matriculas", id: :serial, force: :cascade do |t|
    t.string "estado"
    t.string "matricula"
    t.date "fecha_inscripcion"
    t.string "libro"
    t.integer "folio"
    t.date "fecha_habilitacion"
    t.string "nota_fecha_habilitacion"
    t.integer "vencimiento"
    t.string "especialidad"
    t.date "fecha_vencimiento"
    t.integer "profesional_id"
    t.text "notas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.float "monto_abonado"
    t.date "fecha_pago"
    t.string "nro_recibo"
    t.integer "profesional_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notas"
    t.integer "cuota_anio"
    t.string "concepto"
  end

  create_table "profesionales", id: :serial, force: :cascade do |t|
    t.string "apellido"
    t.string "nombres"
    t.date "fecha_nacimiento"
    t.string "tipo_doc"
    t.integer "nro_doc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.integer "profesional_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
