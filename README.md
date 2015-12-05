# Ruby Rails API Serializers Example

## Generate Rails API App with db PostgresSQL
```
mkdir rails-api-serializers-example
cd rails-api-serializers-example
rails new . -d postgresql --api
```

## Add those gems to Gemfile

```

```

## Generate model post
```
rails g model post title:string body:text
```
## Generate model comment
```
rails g model comment body:text
```
## Generate model tag
```
rails g model tag tag:string
```
## Generate model section
```
rails g model section tag:string
```
## Generate model post_tag references to post and tag
```
rails g model post_tag post:references tag:references
```
## Generate model comment_tag references to comment and tag
```
rails g model comment_tag comment:references tag:references
```