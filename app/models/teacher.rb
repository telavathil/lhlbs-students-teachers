class Teacher < ActiveRecord::Base
  # implement your Student model here
  has_many :students
  validates :email, uniqueness: true
end
