# rails helper takes care a lot of things that helps write tests
# in the rails environment
require "rails_helper"

# here we use describe and pass the object name of HomeController
# followed by us explicitly saying that this is a test of a 
# controller
describe HomeController, :type => :controller do 

  # the syntax of these tests is the same
  # Behavior Driven Development syntax as the Jasmine
  # javascript testing framework
  it "should get page for index" do
    # Inside the it block is the meat of our tests
    # we use 'get' method to simulate a GET request,
    # asking for the view 'index'
    get :index

    # expect is an example of how we assert something is true
    # in this case we expect the response from the get to be
    # a success
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end