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

    validates :username, presence: true 
    validates :username, uniqueness: true 
    # validates :password, length: {minimum: 6, allow_nil: true}
    
    attr_reader :password

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end


end
