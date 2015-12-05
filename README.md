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

