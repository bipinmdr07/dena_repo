class TrackFinder
  def initialize(course_name:)
    @course_name = course_name
  end

  def track
    Course::TRACKS.detect{|track| track.courses.include?(@course_name)}
  end
end