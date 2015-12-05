# Ruby Rails API Serializers Example

## Generate Rails API App with db PostgresSQL
```
mkdir rails-api-serializers-example
cd rails-api-serializers-example
rails new . -d postgresql --api
```

## Add those gems to Gemfile

```
gem 'active_model_serializers'
gem 'versionist'

gem 'rspec-rails', '~> 3.0'
gem 'factory_girl_rails'
gem 'shoulda-matchers'
gem 'ffaker', :git => 'https://github.com/EmmanuelOga/ffaker.git'
gem 'awesome_print'
```

## Then run command
```
bundle install
```

## Generate Rspec
```
rails generate rspec:install
```
To test run this command:
```
bundle exec rspec
```

## Generate model post, tag, comment, post_tag, comment_tag
### Generate model section
```
rails g model section name:string
```

### Generate model post
```
rails g model post title:string body:text
```
### Generate model comment
```
rails g model comment body:text post:references
```
### Generate model tag
```
rails g model tag name:string
```

### Generate model post_tag references to post and tag
```
rails g model post_tag post:references tag:references
```
### Generate model comment_tag references to comment and tag
```
rails g model comment_tag comment:references tag:references
```

## Creating a Serializer
For model post
```
rails g serializer post
rails g serializer comment
```

## Migration
```
rake db:migrate
```

## Create data for test add code to file: db/seeds.rb
```
100.times do |index|
  post_data = {
    title: FFaker::Lorem.sentence,
    body: FFaker::Lorem.paragraph
  }
  post = Post.create(post_data).tap do |post|
    20.times do |comment_index|
      comment_data = { body: FFaker::Lorem.paragraph }
      post.comments.create!(comment_data)
      puts "Comment for post #{index} - #{comment_index}: #{comment_data.to_json}"
    end
  end
  puts "Post #{index}: #{post.to_json}"
end
```
Then run:
```
rake db:seed
```

## Generate version API use gem versionist
Please read more https://github.com/bploetz/versionist
#### Create new api
versionist syntax
```
rails g versionist:new_api_version <API version> <module namespace API> [options]

```
Create API version v1, module V1, option --path=value:v1 --default
```
rails g versionist:new_api_version v1 V1 --path=value:v1 --default
```

#### Create API get post list
Expect /v1/posts, use with versionist:new_controller
```
rails g versionist:new_controller <name> <module namespace>
```
With post API, routes là /v1/posts
```
rails g versionist:new_controller posts V1
```

## Run
```
rails s
```
Then access to see result:
```
http://localhost:3000/v1/posts
http://localhost:3000/v1/comments
```

## Test: post model and post api with version v1
#### Create fixture data for post
Edit file spec/factories/posts.rb
```
FactoryGirl.define do
  factory :post do
    title { FFaker::Lorem.sentence }
    body { FFaker::Lorem.paragraph }
  end
end
```
#### Create test case for post model
Edit file spec/models/post_spec.rb
```
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
```
Finally run command to test model post:
```
rspec spec/models/post_spec.rb
```

#### Test post api v1
- Test response code successful is 200
- Test data
```
require 'rails_helper'
require 'spec_helper'

describe V1::PostsController do
  before do
    @post = FactoryGirl.create :post
    get "/v1/posts", format: :json
  end

  it 'return post information' do
    post = JSON.parse(response.body, symbolize_names: true).first
    expect(post[:title]).to eql @post.title
    expect(post[:body]).to eql @post.body
  end

  it 'response code' do
    expect(response).to have_http_status(200)
  end
end
```
Then run test:
```
rspec spec/requests/v1/posts_controller_spec.rb
```
