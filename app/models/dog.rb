class Dog < ActiveRecord::Base

  validates :first_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :last_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: true
  validates :dog_name, presence: true, format: { with: /\w[a-z]+\z/i }

  def full_name
    self.first_name + " " + self.last_name
  end

end
