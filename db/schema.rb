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

ActiveRecord::Schema.define(version: 20170414171651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["post_id"], name: "index_messages_on_post_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "messages", "posts"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "users"

  create_view :post_messages,  sql_definition: <<-SQL
      SELECT row_number() OVER (PARTITION BY m.post_id ORDER BY m.created_at) AS message_number,
      m.id,
      m.post_id,
      m.user_id,
      u.email,
      m.body,
      m.created_at,
      m.updated_at
     FROM (messages m
       JOIN users u ON ((m.user_id = u.id)))
    ORDER BY m.created_at;
  SQL

  create_view :post_listings,  sql_definition: <<-SQL
      WITH posts_cte AS (
           SELECT p_1.id,
              p_1.title,
              p_1.user_id,
              count(m.id) AS messages_count,
              p_1.created_at,
              p_1.updated_at
             FROM (posts p_1
               LEFT JOIN messages m ON ((p_1.id = m.post_id)))
            GROUP BY p_1.id
          ), max_message_numbers_cte AS (
           SELECT post_messages.post_id,
              max(post_messages.message_number) AS message_number
             FROM post_messages
            GROUP BY post_messages.post_id
          )
   SELECT p.id,
      p.title,
      p.user_id,
      u.email AS post_author,
      p.messages_count,
      last_message.user_id AS last_author_user_id,
      last_message.email AS last_author_email,
      last_message.created_at AS last_message_at,
      last_message.message_number AS last_message_number,
      p.created_at,
      p.updated_at
     FROM (((posts_cte p
       JOIN users u ON ((u.id = p.user_id)))
       LEFT JOIN ( SELECT max_message_numbers_cte.post_id,
              max_message_numbers_cte.message_number
             FROM max_message_numbers_cte) max_message_numbers ON ((max_message_numbers.post_id = p.id)))
       LEFT JOIN post_messages last_message ON (((last_message.post_id = p.id) AND (last_message.message_number = max_message_numbers.message_number))))
    ORDER BY last_message.created_at DESC;
  SQL

end
