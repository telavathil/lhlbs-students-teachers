class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  validates :email, uniqueness: true
  validate :validate_email
  validate :age_validator


  def validate_email
    self.errors.add(:email, "#{email} is not a valid email") unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.match(email)
  end

  private def age_validator
      self.errors.add(:birthday, "Too young; only #{age} years old.") unless age > 3
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end
