class Track
  attr_reader :number, :title, :description, :icons, :timeline, :courses

  def initialize(args)
    @number = args.fetch(:number)
    @title = args.fetch(:title)
    @description = args.fetch(:description)
    @icons = args.fetch(:icons)
    @timeline = args.fetch(:timeline)
    @courses = args.fetch(:courses)
  end
end 