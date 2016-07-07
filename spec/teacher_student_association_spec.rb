require_relative 'spec_helper'

describe Teacher,Student do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers) &&
    ActiveRecord::Base.connection.table_exists?(:students)
  end

  context 'associations' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        first_name: 'Tobin',
        last_name: 'Smith',
        email: 'tsmith@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )

      @student = Student.new
      @student.assign_attributes(
        first_name: 'Happy',
        last_name: 'Gilmore',
        gender: 'male',
        birthday: Date.new(1970, 9, 1)
      )
      @teacher.save
      @student.save
    end

    it "should associate a student with teacher" do
      @student.teacher = @teacher
      expect(@teacher.students.includes(@student))
    end

  end
end
