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
export PATH=/opt/homebrew/opt/sqlite3/bin:$PATH

Desktop:
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/3.3.0/bin:$PATH


ruby --version
rails --version
sqlite3 --version

## From https://guides.rubyonrails.org/api_app.html
...From the app directory...
rails server
rails g scaffold Group name:string
rails db:migrate

rails conosle :
    Group.create(name: "Rails Founders")
    Group.create(name: "Rails Contributors")

