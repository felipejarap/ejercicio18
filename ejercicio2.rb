require 'date'

# This exercise was done using https://github.com/RodolfoPena/E9CP2A1/blob/master/ejercicio2.rb as reference.
class Course
  attr_accessor :name
  attr_accessor :first_date
  attr_accessor :last_date

  def initialize(name, first_date, last_date)
    @name = name
    @first_date = Date.parse(first_date)
    @last_date = Date.parse(last_date)
  end
end

def open_file(file_name)
  file = File.open(file_name, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data
end

def create_array_of_objects(array)
  new_data = []
  array.each do |line|
    lines = line.split(', ')
    new_data << Course.new(*lines)
  end
  new_data
end

file_name = 'cursos.txt'
courses = create_array_of_objects(open_file(file_name))

def courses_before(courses, selected_date = '2017-10-31')
  date = Date.parse(selected_date)
  raise ArgumentError, "Argument's date is further than permitted" unless date >= Date.parse("2018-01-01")
  courses_ongoing = courses.select { |course| course.first_date < date }
  puts "Courses that start before #{date}:"
  courses_ongoing.each do |course|
    puts "  #{course.name}"
  end
end

def courses_after(courses, selected_date = Date.today)
  date = selected_date
  raise ArgumentError, "Argument's date is further than permitted" unless date >= Date.parse("2018-01-01")
  courses_ended = courses.select { |course| course.last_date > date }
  puts "Courses that end after #{date}"
  courses_ended.each do |course|
    puts "  #{course.name}"
  end
end

def run_program(file_name)
  courses_before(file_name)
  courses_after(file_name)
end

run_program(courses)