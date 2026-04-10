# Ruby on Rails API - Agent Instructions

## Development Commands

- Start server: `rails server` or `rails s`
- Run console: `rails console`
- Run migrations: `rails db:migrate`
- Reset database: `rails db:reset`

## Testing

- Run all tests: `rails test`
- Run specific test file: `rails test test/models/group_test.rb`
- Run system tests: `rails test:system`

## Linting & Code Style

- No rubocop configured
- Follow Rails 7.1 conventions (RESTful routes, conventional controllers, bcrypt for passwords)
- Use JSON API response format

## Common Tasks

- Generate scaffold: `rails generate scaffold ModelName field:type`
- Create migration: `rails generate migration AddColumnToTable`
- Create model: `rails generate model ModelName`
- Create controller: `rails generate controller ControllerName`

## Project Structure

```
app/
├── controllers/   # API controllers
├── models/        # Domain models
├── scripts/       # Dev helper scripts
└── views/         # JSON views (if any)
config/
├── routes.rb      # API routes
└── application.rb # Rails config
db/
├── migrate/       # Database migrations
└── schema.rb      # Database schema
test/              # Minitest tests
```