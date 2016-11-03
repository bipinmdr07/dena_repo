class TrackFinder
  attr_reader :track

  def initialize(course_name:)
    @course_name = course_name
    @track = Course::TRACKS.detect{|track| track.courses.include?(@course_name)}
  end
end