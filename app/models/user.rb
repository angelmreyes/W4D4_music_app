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

class User < ApplicationRecord

  after_initialize
  
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
    self.password_digest = 
  end

  def ensure_session_token
  end

  def reset_session_token!
  end
end
