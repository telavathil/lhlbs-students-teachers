require_relative 'spec_helper'

describe Teacher do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers)
  end
  context 'validations' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        first_name: 'Tobin',
        last_name: 'Smith',
        email: 'tsmith@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )
      @teacher.save
    end

    it "should not accept duplicate emails" do
        @teacher2 = Teacher.new
        @teacher2.assign_attributes(
          first_name: 'Tobin',
          last_name: 'Smith',
          email: 'tsmith@oaklandhiphop.net',
          phone: '(510) 555-1212 x4567'
        )
        expect(@teacher2.save).to be_falsy
    end

  end
end
