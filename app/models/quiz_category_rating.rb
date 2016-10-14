class QuizCategoryRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz_category

  validates :user, :quiz_category, presence: true

  def self.create_or_rank!(args)
    current_user = args.fetch(:current_user)
    quiz_submission = args.fetch(:quiz_submission)
    quiz_category = quiz_submission.quiz_category
    current_score = calculate_current_score(quiz_submission: quiz_submission)

    if quiz_category_rating = current_user.quiz_category_ratings.where(quiz_category: quiz_category).any?
      score = calculate_mean_score(quiz_category_rating: quiz_category_rating, current_score: current_score)

      quiz_category_rating.update(score: score)
      quiz_category_rating.increment(:submission_count)
    else
      current_user.quiz_category_ratings.create(quiz_category_id: quiz_category.id)
    end
  end

  private

  def calculate_current_score(args)
    quiz_submission = args.fetch(:quiz_submission)
    return 100 if quiz_submission.check_answer
    0
  end

  def calculate_mean_score(args)
    quiz_category_rating = args.fetch(:quiz_category_rating)
    current_score = args.fetch(:current_score)

    (quiz_category_rating.score + current_score) / (quiz_category_rating.submission_count + 1)
  end
end
