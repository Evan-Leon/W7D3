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

    end
end
