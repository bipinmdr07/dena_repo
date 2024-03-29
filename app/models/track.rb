class Track
  attr_reader :number, :title, :description, :icons, :timeline, :courses, :quiz_problems

  def initialize(args)
    @number = args.fetch(:number)
    @title = args.fetch(:title)
    @description = args.fetch(:description)
    @icons = args.fetch(:icons)
    @timeline = args.fetch(:timeline)
    @courses = args.fetch(:courses)
    @quiz_problems = QuizProblem.where(course_name: @courses).count    
  end
end 