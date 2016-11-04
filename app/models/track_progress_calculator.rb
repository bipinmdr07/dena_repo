class TrackProgressCalculator
  def initialize(args)
    @user = args.fetch(:user)
    @track = args.fetch(:track)
  end

  def calculate
    progression_count = @user.progressions.where(course_name: @track.courses).count
    lesson_count = @track.courses.inject(0){|sum, course| sum + course.constantize.lesson_length}

    ((progression_count.to_f / lesson_count.to_f) * 100).round(2)
  end
end