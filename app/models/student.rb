class Student
  attr_reader :first_name

  @@all = []
  
  def initialize(first_name)
    @first_name = first_name
    @@all = self
  end
  
  def self.all
    @@all
  end
  
  def add_boating_test(boating_test_name, boating_test_status, instructor)
    BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
  end
  
  def self.find_student(name)
    self.all.find {|student| student.first_name == name}
  end

  def tests 
    BoatingTest.all.select {|test| test.student == self}
  end

  def passed_tests
    tests.select {|test| test.boating_test_status == "passed"}
  end

  def grade_percentage
     percent_float = passed_tests.size/tests.size.to_f
    percent_float*100
  end


end

