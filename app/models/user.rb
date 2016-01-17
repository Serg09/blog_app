class User < ActiveRecord::Base
  attr_accessor :remember_token
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
                   format: { with: /\A[a-zA-Z]+\z/, message: "should only contain letters" },
                   presence: true
    name.validates :email, length: { maximum: 255 },
                   format: { with: /\A([^@\s]+)@((?:[-A-Z-a-z0-9]+\.)+[A-Za-z]{2,})\z/i},
                   presence: true, uniqueness: { case_sensitive: false }
    has_secure_password
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # VALID_EMAIL_REGEX = /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=_]).*$/
    name.validates :password, presence: true, allow_nil: true, length: { minimum: 6 },
                   format: { with: /\A^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=_]).*$\z/,
                   message: "must be at least 6 characters and include one special character,
                            one number, and one Upper and lower case letter."}
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
