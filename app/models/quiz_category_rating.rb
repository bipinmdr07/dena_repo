class QuizCategoryRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz_category
  has_many :quiz_submissions

  validates :user, :quiz_category, presence: true
  validates :quiz_category, uniqueness: { scope: :user_id }

  def self.create_or_rank!(args)
    current_user = args.fetch(:current_user)
    quiz_submission = args.fetch(:quiz_submission)
    checked_option_ids = args.fetch(:checked_option_ids)

    quiz_category = quiz_submission.quiz_category
    current_score = quiz_submission.calculate_score(checked_option_ids: checked_option_ids)
    quiz_category_rating = current_user.quiz_category_ratings.find_by(quiz_category: quiz_category)

    if quiz_category_rating

      score = self.calculate_mean_score(quiz_category_rating: quiz_category_rating, current_score: current_score)

      quiz_category_rating.update(score: score)

    else
      quiz_category_rating = current_user.quiz_category_ratings.create(quiz_category_id: quiz_category.id,
                                                                       score: current_score)
    end

    quiz_submission.save
  end


  def self.calculate_mean_score(args)
    quiz_category_rating = args.fetch(:quiz_category_rating)
    current_score = args.fetch(:current_score)

    (quiz_category_rating.score + current_score) / (quiz_category_rating.quiz_submissions_count + 1)
  end
end
