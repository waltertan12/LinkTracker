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

ActiveRecord::Schema.define(version: 20161219004933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "resource_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "resource_id"], name: "index_favorites_on_user_id_and_resource_id", unique: true, using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.string   "invite_digest",                   null: false
    t.boolean  "valid",           default: false
    t.datetime "expiration_date",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["expiration_date"], name: "index_invites_on_expiration_date", using: :btree
    t.index ["invite_digest"], name: "index_invites_on_invite_digest", using: :btree
    t.index ["valid"], name: "index_invites_on_valid", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "link_source", null: false
    t.integer  "resource_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["link_source", "resource_id"], name: "index_links_on_link_source_and_resource_id", unique: true, using: :btree
    t.index ["link_source"], name: "index_links_on_link_source", using: :btree
    t.index ["resource_id"], name: "index_links_on_resource_id", using: :btree
  end

  create_table "resource_links", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.integer  "link_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id", "link_id"], name: "index_resource_links_on_resource_id_and_link_id", unique: true, using: :btree
  end

  create_table "resource_tags", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id", "tag_id"], name: "index_resource_tags_on_resource_id_and_tag_id", unique: true, using: :btree
  end

  create_table "resource_types", force: :cascade do |t|
    t.string   "resource_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type"], name: "index_resource_types_on_resource_type", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",                           null: false
    t.integer  "resource_type_id",                null: false
    t.integer  "rating",                          null: false
    t.text     "notes"
    t.integer  "user_id",                         null: false
    t.boolean  "private",          default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["private"], name: "index_resources_on_private", using: :btree
    t.index ["rating"], name: "index_resources_on_rating", using: :btree
    t.index ["resource_type_id"], name: "index_resources_on_resource_type_id", using: :btree
    t.index ["title"], name: "index_resources_on_title", using: :btree
    t.index ["user_id"], name: "index_resources_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email", "password_digest"], name: "index_users_on_email_and_password_digest", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", using: :btree
  end

end
