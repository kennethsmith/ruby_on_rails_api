# ruby_on_rails_api

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Environment
Laptop:
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH

Desktop:
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/3.3.0/bin:$PATH


ruby --version
rails --version
sqlite3 --version


## Debugging
bundle exec rdbg --open -n -c -- bundle exec rails s


## From https://guides.rubyonrails.org/api_app.html
...From the app directory...
rails server
rails g scaffold Group name:string
rails db:migrate

rails conosle :
    Group.create(name: "Rails Founders")
    Group.create(name: "Rails Contributors")

ruby ./app/scripts/http_requests.rb (runs the API script, really in tough spot, just dev iteration)

rails middleware

bundle install (add rack-cache, faraday and bcrypt)

rails generate migration CreateUsers email:string password:string username:string image:string
rails generate migration CreatePrompts prompt:string tag:string username:string image:string
rails generate migration AddUserRefToPrompts user:references
rails db:migrate
rails generate migration AddPasswordDigestToUsers password_digest:string
rails db:migrate
rails generate migration AddContentToPrompts content:string
rails generate migration RemovePromptFromPrompts prompt:string
rails db:migrate
rails db:migrate
rails db:migrate

## Error handling for APIs?
rails g controller errors not_found internal_server_error

## Auth?
https://medium.com/@zachlandis91/authentication-and-authorization-in-ruby-on-rails-c44c1ccea94d

## Take
I'm not sure why anyone would choose this as an API framework from greenfield. There are so many frameworks that are lighter weight and that are made for APIs. Seems like an OK option for an MVC web application, that is not my cup of tea though. I prefer clean seperation of concerns between the API and the UI.

## Status
I am leaving this a very raw state.
- CRUD is not complete for users. Still need RUD.
- Lookups should be happening for reference indexes rather than client passing in.
- Validations on the session/JWT should be happening, zero auth here.
- Deleting more cruft that is created by generating this from rails needs to be done.
- Testing...
- So much more, really a lot to do here.