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

  # ? whats the deal with callbacks
  # Ensures that certain code will run whenever an 
  # Active Record object is created, saved, updated, deleted, validated, or loaded from the database.
  after_initialize :ensure_session_token
  
  attr_reader :password
  
  def find_by_credentials(email, password)
  end

  def is_password?(password) #checks user's password during log in
  end

  def generate_session_token
  end

  def validations
  end

  def password=(password) #sets the password_digest using BCrypt
    # self.password_digest = 
  end

  def reset_session_token!
  end

  private

  def ensure_session_token
    # self.session_token ||= 
  end
end
