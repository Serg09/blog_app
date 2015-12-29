class User < ActiveRecord::Base
  before_save { email.downcase! }

  # before_save do
  #   self.email.downcase! if self.email
  # end
  #
  # def self.find_for_authentication(conditions)
  #   conditions[:email].downcase!
  #   super(conditions)
  # end

  with_options if: :first_name do |name|
    name.validates :first_name, length: { minimum: 3, maximum: 50 },
                   format: { with: /\A[a-zA-Z]+\z/, message: "should only contain letters" },
                   presence: true
    name.validates :last_name, length: { minimum: 2, maximum: 50 },
                   format: { with: /\A[a-zA-Z]+\z/, message: "should only contain letters" }, presence: true
    name.validates :email, length: { maximum: 255 },
                   format: { with: /\A([^@\s]+)@((?:[-A-Z-a-z0-9]+\.)+[A-Za-z]{2,})\z/i},
                   presence: true, uniqueness: { case_sensitive: false }
    has_secure_password
    name.validates :password, presence: true, length: { minimum: 6 }
  end
end
