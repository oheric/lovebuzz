require "rails_helper"
# here we must explicitly include shouldamatchers here because
# of the way we included in the Gemfile as 'require: false'
require "shoulda/matchers"


describe User do 
# user = FactoryGirl.create(:a_user) 
#   it "has an email" do
 
#     expect(user.email).to_not be_nil
#   end

#   it "has a password" do
    
#     expect(user.password).to_not be_nil
#   end

it { should validate_uniqueness_of(:email) }
# validate that a string like 'a@a.com' is accepted as an email
it do 
  should allow_value('a@a.com').
  for(:email)
end

# this one is tricky because there isn't a not_allow_value
# matcher, so we use !. This verifies that 'bob' is not 
# accepted as a valid email
it do 
  should !allow_value('bob').
  for(:email)
end

# test both min and max validation attributes are present
it { should ensure_length_of(:password).is_at_least(6) }
it { should ensure_length_of(:password).is_at_most(20) }
it { should ensure_length_of(:email).is_at_most(255) }

end