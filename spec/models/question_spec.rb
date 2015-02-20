require "rails_helper"
require "shoulda/matchers"

describe Question do 
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(50)}
  it { should belong_to(:quiz)}

end