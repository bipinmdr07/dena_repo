class Lesson < ApplicationRecord
  Chapter = Struct.new(:title)
  Lesson = Struct.new(:id, :title, :chapter)
  Track = Struct.new

  TRACKS = [
    Track.new(name: "Introduction to Front-End Development",
              description: "You'll gain the basic skillset of front end development by developing real web pages using HTML, CSS, and Bootstrap. You'll build multiple web pages including a modern-looking resume page and a portfolio website to showcase yourskills.",
              icons: "/prof.jpg",
              timeline: "1",
              path: "/intro"),
    Track.new(name: "Ruby Fundamentals", 
              description: "Build real programs and gradually solve coding challenges by learning the basics of the powerful Ruby programming language. You'll have the skillset to solve real interview problems by the end of the course.",
              icons: "",
              timeline: "2",
              path: "/fundamentals")
  ]

  def self.lesson_length
    self::LESSONS.length
  end
end
