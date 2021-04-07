require 'rails_helper'

#validations
#associations
#class-methods
#error-messages

RSpec.describe User, type: :model do
  
    subject(:user) {FactoryBot.build(:user)}

    describe "validations"  do 
        it { should validate_presence_of(:username)}
        it { should validate_presence_of(:session_token)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_uniqueness_of(:username)}
        it { should validate_uniqueness_of(:session_token)}
        it {should validate_length_of(:password).is_at_least(6) }
    end

    describe "class methods" do
        
        describe '::find_by_credentials' do 
            context "with a valid username and password" do

                it 'should return correct user' do 
                    expect(User.find_by_credentials).to eq(:user.username)
                end
            end 
            context "with an invalid username" do 
                it 'should return nil' do 
                    expect(User.find_by_credentials).to eq(nil)
                end
            end
        end

    end

    describe "password methods"



end

end
