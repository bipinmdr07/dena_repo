class AddOnDeleteCascadeToForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "quiz_completions", "users"
    remove_foreign_key "quiz_options", "quiz_problems"
    remove_foreign_key "quiz_problem_cards", "quiz_problems"
    remove_foreign_key "quiz_problem_cards", "users"
    remove_foreign_key "quiz_submissions", "quiz_category_ratings"
    remove_foreign_key "quiz_submissions", "quiz_problems"
    remove_foreign_key "quiz_submissions", "users"

    add_foreign_key "quiz_completions", "users", on_delete: :cascade
    add_foreign_key "quiz_options", "quiz_problems", on_delete: :cascade
    add_foreign_key "quiz_problem_cards", "quiz_problems", on_delete: :cascade
    add_foreign_key "quiz_problem_cards", "users", on_delete: :cascade
    add_foreign_key "quiz_submissions", "quiz_category_ratings", on_delete: :cascade
    add_foreign_key "quiz_submissions", "quiz_problems", on_delete: :cascade
    add_foreign_key "quiz_submissions", "users", on_delete: :cascade
  end
end
