# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_and_session_token  (email,session_token) UNIQUE
#

class User < ApplicationRecord
  #practice validation writing and understand each
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true #search, read about the allow_nil and length 

  # ? whats the deal with callbacks
  # Ensures that certain code will run whenever an 
  # Active Record object is created, saved, updated, deleted, validated, or loaded from the database.
  after_initialize :ensure_session_token
  
  attr_reader :password
  
  #understand each of the methods bellow and be able to write from memory

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.is_password?(password)
    user
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64 
  end

  def password=(password) #sets the password_digest using BCrypt
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password) #checks user's password during log in
    bcrypt_password = BCrypt::Password.new(self.password_digest)
    bcrypt_password.is_password?(password)
  end

  def reset_session_token!
    self.update!(session_token: User.generate_session_token)
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
