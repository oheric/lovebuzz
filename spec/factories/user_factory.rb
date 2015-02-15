# Factory Girl expects that each class inherits from ActiveRecord
# All factory declaration get wrapped in a FactoryGirl.define block
FactoryGirl.define do 
  # we define a factory name, and then specify the class
  factory :a_user, class: User do 
    # these setup the attributes, each declaration is a method call
    email ""
    password ""

  end
end