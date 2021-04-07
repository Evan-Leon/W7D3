# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#
require 'rails_helper'

#validations
#associations
#class-methods
#error-messages

RSpec.describe User, type: :model do
  
    subject(:user) {FactoryBot.build(:user)}

    describe 'validations'  do 
        it { should validate_presence_of(:username)}
        it { should validate_presence_of(:session_token)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_uniqueness_of(:username)}
        it { should validate_uniqueness_of(:session_token)}
        it { should validate_length_of(:password).is_at_least(6) }
    end

    describe 'class methods' do
        
        describe '::find_by_credentials' do 
            context 'with a valid username and password' do

                it 'should return correct user' do 
                    expect(User.find_by_credentials).to eq(:user.username)
                end
            end 
            context 'with an invalid username' do 
                it 'should return nil' do 
                    expect(User.find_by_credentials).to eq(nil)
                end
            end
        end

    end

    describe 'password methods' do 
        describe 'it does not save passwords to the database' do
            it ' saves passwords properly' do 
                expect(BCrypt::Password.create('password')).to eq(:password_digest)
            end
            it 'properly sets the password reader' do 
                expect(user.password).to eq("password")
            end
        end
    end

    describe 'session token methods' do
        it 'assigns a session token if one is not given' do
            expect(user.session_token).not_to be_nil 
        end

        it 'resets the session token on the user' do 
            old_token = user.session_token 
            new_token = user.reset_session_token!
            expect(old_token).not_to eq(new_token)
        end

    end


end

