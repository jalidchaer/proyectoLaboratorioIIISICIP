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

ActiveRecord::Schema.define(version: 20161121015645) do

  create_table "arbols", force: :cascade do |t|
    t.integer "tipo",     limit: 4,                null: false
    t.string  "text",     limit: 50,  default: "", null: false
    t.string  "vinculo",  limit: 100, default: "", null: false
    t.integer "padre_id", limit: 4
  end

  create_table "cdchts", force: :cascade do |t|
    t.date     "fechainicio"
    t.date     "fechafin"
    t.string   "tipoproyecto", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.integer "idestado", limit: 4,               null: false
    t.string  "nombre",   limit: 25, default: "", null: false
  end

  create_table "clases", force: :cascade do |t|
    t.string  "semana",   limit: 2,     null: false
    t.text    "objetivo", limit: 65535, null: false
    t.integer "padre",    limit: 4,     null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estados_proyectos", id: false, force: :cascade do |t|
    t.integer  "proyecto_id", limit: 4, null: false
    t.integer  "estado_id",   limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "evaluacions", force: :cascade do |t|
    t.string   "resp1",       limit: 255
    t.string   "resp2",       limit: 255
    t.string   "resp3",       limit: 255
    t.string   "resp4",       limit: 255
    t.string   "resp5",       limit: 255
    t.string   "resp6",       limit: 255
    t.string   "resp7",       limit: 255
    t.string   "resp8",       limit: 255
    t.string   "resp9",       limit: 255
    t.string   "resp10",      limit: 255
    t.string   "conclusion",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "proyecto_id", limit: 4
  end

  add_index "evaluacions", ["proyecto_id"], name: "index_evaluacions_on_proyecto_id", using: :btree

  create_table "evaluadores", force: :cascade do |t|
    t.string   "cedula",          limit: 255
    t.string   "apellido",        limit: 255
    t.string   "titulo",          limit: 255
    t.string   "especializacion", limit: 255
    t.boolean  "maestria"
    t.boolean  "doctorado"
    t.string   "universidad",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "evaluadores_proyectos", id: false, force: :cascade do |t|
    t.integer "proyecto_id",   limit: 4, null: false
    t.integer "evaluadore_id", limit: 4, null: false
  end

  create_table "evaluar_proyectos", force: :cascade do |t|
    t.string   "resp1",      limit: 255
    t.string   "resp2",      limit: 255
    t.string   "resp3",      limit: 255
    t.string   "resp4",      limit: 255
    t.string   "resp5",      limit: 255
    t.string   "resp6",      limit: 255
    t.string   "resp7",      limit: 255
    t.string   "resp8",      limit: 255
    t.string   "resp9",      limit: 255
    t.string   "resp10",     limit: 255
    t.string   "resultado",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "has_evaluadores", force: :cascade do |t|
    t.integer  "proyecto_id",   limit: 4
    t.integer  "evaluadore_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "has_evaluadores", ["evaluadore_id"], name: "index_has_evaluadores_on_evaluadore_id", using: :btree
  add_index "has_evaluadores", ["proyecto_id"], name: "index_has_evaluadores_on_proyecto_id", using: :btree

  create_table "informes", force: :cascade do |t|
    t.string   "filename",          limit: 255
    t.string   "content_type",      limit: 255
    t.binary   "file_contents",     limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "attachment",        limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "investigadors", force: :cascade do |t|
    t.string   "cedula",      limit: 255
    t.integer  "proyecto_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "jointable_evaluadores_proyectos", force: :cascade do |t|
    t.string "proyecto",   limit: 255
    t.string "evaluadore", limit: 255
  end

  create_table "proyecs", force: :cascade do |t|
    t.string   "titulo",              limit: 255
    t.string   "categoria",           limit: 255
    t.string   "lineainvestigacion",  limit: 255
    t.string   "unidadinvestigacion", limit: 255
    t.string   "duracion",            limit: 255
    t.float    "monto",               limit: 24
    t.string   "estado",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "proyectos", force: :cascade do |t|
    t.date     "fecha"
    t.string   "codigo",                 limit: 255
    t.string   "responsable",            limit: 255
    t.string   "titulo",                 limit: 255
    t.string   "objetivogeneral",        limit: 255
    t.string   "objetivosespecifo",      limit: 255
    t.string   "resumen",                limit: 255
    t.integer  "duracion",               limit: 4
    t.float    "monto",                  limit: 24
    t.string   "estado",                 limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "investigador_id",        limit: 4
    t.string   "filename",               limit: 255
    t.string   "content_type",           limit: 255
    t.binary   "file_contents",          limit: 65535
    t.string   "plantilla_file_name",    limit: 255
    t.string   "plantilla_content_type", limit: 255
    t.integer  "plantilla_file_size",    limit: 4
    t.datetime "plantilla_updated_at"
    t.integer  "cont",                   limit: 4
  end

  create_table "proyects", force: :cascade do |t|
    t.date     "fecha"
    t.string   "codigo",            limit: 255
    t.string   "responsable",       limit: 255
    t.string   "titulo",            limit: 255
    t.string   "objetivogeneral",   limit: 255
    t.string   "objetivosespecifo", limit: 255
    t.string   "resumen",           limit: 255
    t.integer  "duracion",          limit: 4
    t.float    "monto",             limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "correo",            limit: 255
    t.string   "password_digest",   limit: 255
    t.string   "nombre",            limit: 255
    t.string   "apellido",          limit: 255
    t.integer  "rol",               limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "cedula",        limit: 255
    t.string   "usuario",       limit: 255
    t.string   "clave",         limit: 255
    t.string   "nivel",         limit: 255
    t.date     "fecharegistro"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "evaluacions", "proyectos"
  add_foreign_key "has_evaluadores", "evaluadores"
  add_foreign_key "has_evaluadores", "proyectos"
end
