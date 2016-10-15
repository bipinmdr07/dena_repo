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

ActiveRecord::Schema.define(version: 20161015042602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "question"
    t.text     "answer"
    t.string   "topic"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "prev_ef",             default: 2.5
    t.float    "prev_interval",       default: 0.0
    t.float    "quality_response"
    t.float    "calculated_interval"
    t.float    "calculated_ef"
    t.datetime "repetition_date"
    t.string   "lesson_url"
    t.boolean  "archived",            default: false
    t.boolean  "master",              default: false, null: false
    t.integer  "deck_id"
    t.index ["archived", "user_id"], name: "index_cards_on_archived_and_user_id", using: :btree
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
    t.index ["master"], name: "index_cards_on_master", using: :btree
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
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
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "forum_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "lesson"
    t.integer  "user_id"
    t.boolean  "resolved",    default: false
    t.string   "course_name"
    t.index ["forum_id"], name: "index_comments_on_forum_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "master",     default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["master"], name: "index_decks_on_master", using: :btree
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.text     "overview"
    t.string   "facebook_link"
    t.datetime "datetime"
    t.string   "venue"
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "featured_image"
    t.string   "signup_link"
  end

  create_table "forums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_id"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo"
  end

  create_table "intros", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentor_sessions", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "user_id"
    t.text     "private_details"
    t.text     "public_details"
    t.text     "homework_assigned"
    t.datetime "session_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["mentor_id"], name: "index_mentor_sessions_on_mentor_id", using: :btree
    t.index ["user_id"], name: "index_mentor_sessions_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["actor_id"], name: "index_notifications_on_actor_id", using: :btree
    t.index ["notifiable_id"], name: "index_notifications_on_notifiable_id", using: :btree
    t.index ["recipient_id", "created_at"], name: "index_notifications_on_recipient_id_and_created_at", using: :btree
    t.index ["recipient_id", "read_at"], name: "index_notifications_on_recipient_id_and_read_at", using: :btree
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.string   "featured_image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
    t.index ["slug"], name: "index_posts_on_slug", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "progressions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.string   "course_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_name"], name: "index_progressions_on_course_name", using: :btree
    t.index ["lesson_id"], name: "index_progressions_on_lesson_id", using: :btree
    t.index ["user_id", "lesson_id", "course_name"], name: "index_progressions_on_user_id_and_lesson_id_and_course_name", using: :btree
    t.index ["user_id"], name: "index_progressions_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "course_name"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "resolved",    default: false
    t.boolean  "mentor_post", default: false
    t.string   "slug"
    t.index ["course_name", "lesson_id"], name: "index_questions_on_course_name_and_lesson_id", using: :btree
    t.index ["course_name"], name: "index_questions_on_course_name", using: :btree
    t.index ["lesson_id"], name: "index_questions_on_lesson_id", using: :btree
    t.index ["slug"], name: "index_questions_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "quiz_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_category_ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_category_id"
    t.float    "score",                  default: 0.0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "quiz_submissions_count", default: 0
    t.index ["quiz_category_id"], name: "index_quiz_category_ratings_on_quiz_category_id", using: :btree
    t.index ["score"], name: "index_quiz_category_ratings_on_score", using: :btree
    t.index ["user_id", "quiz_category_id"], name: "index_quiz_category_ratings_on_user_id_and_quiz_category_id", using: :btree
    t.index ["user_id"], name: "index_quiz_category_ratings_on_user_id", using: :btree
  end

  create_table "quiz_options", force: :cascade do |t|
    t.integer  "quiz_problem_id"
    t.string   "content"
    t.boolean  "correct",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["quiz_problem_id"], name: "index_quiz_options_on_quiz_problem_id", using: :btree
  end

  create_table "quiz_problems", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "course_name"
    t.string   "question"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "quiz_category_id"
    t.index ["course_name", "lesson_id"], name: "index_quiz_problems_on_course_name_and_lesson_id", using: :btree
    t.index ["quiz_category_id"], name: "index_quiz_problems_on_quiz_category_id", using: :btree
  end

  create_table "quiz_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_problem_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["quiz_problem_id"], name: "index_quiz_submissions_on_quiz_problem_id", using: :btree
    t.index ["user_id", "quiz_problem_id"], name: "index_quiz_submissions_on_user_id_and_quiz_problem_id", using: :btree
    t.index ["user_id"], name: "index_quiz_submissions_on_user_id", using: :btree
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "question_id"], name: "index_replies_on_user_id_and_question_id", using: :btree
    t.index ["user_id"], name: "index_replies_on_user_id", using: :btree
  end

  create_table "rich_rich_files", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        default: "file"
  end

  create_table "student_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "mentor_id"
    t.text     "public_details"
    t.text     "private_details"
    t.text     "motivation_level"
    t.integer  "mentor_session_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["mentor_id"], name: "index_student_sessions_on_mentor_id", using: :btree
    t.index ["mentor_session_id"], name: "index_student_sessions_on_mentor_session_id", using: :btree
    t.index ["user_id"], name: "index_student_sessions_on_user_id", using: :btree
  end

  create_table "submission_comments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "lesson"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "submission_id"
    t.boolean  "approved",      default: false
    t.index ["submission_id"], name: "index_submission_comments_on_submission_id", using: :btree
  end

  create_table "submission_replies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "submission_id"
    t.index ["submission_id"], name: "index_submission_replies_on_submission_id", using: :btree
    t.index ["user_id", "submission_id"], name: "index_submission_replies_on_user_id_and_submission_id", using: :btree
  end

  create_table "submissions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "course_name"
    t.string   "title"
    t.string   "content"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.boolean  "approved",    default: false
    t.index ["course_name", "lesson_id"], name: "index_submissions_on_course_name_and_lesson_id", using: :btree
    t.index ["course_name"], name: "index_submissions_on_course_name", using: :btree
    t.index ["lesson_id"], name: "index_submissions_on_lesson_id", using: :btree
    t.index ["user_id"], name: "index_submissions_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "avatar"
    t.string   "name"
    t.boolean  "admin"
    t.boolean  "intro_access",              default: true
    t.boolean  "html_css_access",           default: true
    t.boolean  "ruby_access",               default: false
    t.boolean  "ideator_access",            default: false
    t.boolean  "ruby_core_access",          default: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "instapost_access",          default: false
    t.boolean  "github_access",             default: false
    t.boolean  "javascript_access",         default: false
    t.boolean  "command_line_access",       default: false
    t.boolean  "rspec_blog_access",         default: false
    t.boolean  "mvc_access",                default: false
    t.boolean  "mentor",                    default: false
    t.datetime "start_date"
    t.datetime "graduation_date"
    t.integer  "remaining_mentor_sessions", default: 16
    t.integer  "mentor_id"
    t.string   "facebook_handle"
    t.string   "twitter_handle"
    t.string   "github_handle"
    t.string   "personal_website"
    t.datetime "prework_start_time"
    t.boolean  "admitted",                  default: false
    t.datetime "prework_end_date"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "mobile_number"
    t.boolean  "bootstrap_access",          default: false
    t.string   "provider"
    t.string   "uid"
    t.text     "application_reasons"
    t.integer  "package"
    t.boolean  "collaboration_access",      default: false, null: false
    t.boolean  "skill_academy_access",      default: false, null: false
    t.index ["admitted"], name: "index_users_on_admitted", using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["mentor_id"], name: "index_users_on_mentor_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "quiz_options", "quiz_problems"
  add_foreign_key "quiz_submissions", "quiz_problems"
  add_foreign_key "quiz_submissions", "users"
end
