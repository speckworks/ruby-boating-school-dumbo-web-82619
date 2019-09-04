class Instructor
  attr_reader :name 
  @@all=[]
  
  def initialize(name)
    @name = name
    @@all<< self
  end
  
  def self.all
    @@all
  end
  
  def tests
    BoatingTests.all.select {|test| test.instructor == self}
  end
  
  def pass_student(student, test_name)
    found_test = self.tests.find do |test|
      test.boating_test_name == test_name && test.student == student
    end
    if found_test
      found_test.boating_test_status = "passed"
    else
      BoatingTest.new(student, boating_test_name, "passed", self)
    end
  end
  
  def fail_student
    found_test = self.tests.find 
    {|test|test.boating_test_name == test_name && test.student == student}
    if found_test
      found_test.boating_test_status = "failed"
    else
      BoatingTest.new(student, boating_test_name, "failed", self)
    end
  end
  
  
end
