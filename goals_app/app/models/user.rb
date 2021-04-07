# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#
class User < ApplicationRecord

    validates :username, :session_token, :password_digest, presence: true 
    validates :username, uniqueness: true 
    # validates :password, length: {minimum: 6, allow_nil: true}
    
end
