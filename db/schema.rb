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

ActiveRecord::Schema.define(version: 20170710120102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investment_packages", force: :cascade do |t|
    t.integer  "period"
    t.integer  "investor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "investment_packages", ["investor_id"], name: "index_investment_packages_on_investor_id", using: :btree

  create_table "investment_plan_facts", force: :cascade do |t|
    t.integer  "investment_id"
    t.decimal  "amount_plan_payment",   precision: 15, scale: 2
    t.decimal  "amount_fact",           precision: 15, scale: 2
    t.integer  "period_number"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.decimal  "amount_plan_interest",  precision: 15, scale: 2
    t.decimal  "amount_plan_principal", precision: 15, scale: 2
  end

  add_index "investment_plan_facts", ["investment_id"], name: "index_investment_plan_facts_on_investment_id", using: :btree

  create_table "investments", force: :cascade do |t|
    t.integer  "lendee_id"
    t.integer  "investment_package_id"
    t.decimal  "amount",                precision: 15, scale: 2
    t.float    "base_rate"
    t.float    "overdue_rate"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "status"
  end

  add_index "investments", ["investment_package_id"], name: "index_investments_on_investment_package_id", using: :btree
  add_index "investments", ["lendee_id"], name: "index_investments_on_lendee_id", using: :btree

  create_table "investors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lendees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "investment_packages", "investors"
  add_foreign_key "investment_plan_facts", "investments"
  add_foreign_key "investments", "investment_packages"
  add_foreign_key "investments", "lendees"
end
