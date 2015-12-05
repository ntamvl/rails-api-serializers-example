require 'rails_helper'
require 'spec_helper'

# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Post do
  before { @post = FactoryGirl.build(:post) }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
end
