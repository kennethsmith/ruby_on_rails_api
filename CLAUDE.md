# Ruby on Rails API - Code Conventions

## API Response Format

- JSON APIs only (API-only mode)
- Use `render json:` for responses
- Use `Jbuilder` for complex JSON structures

## Controller Conventions

- Inherit from `ApplicationController`
- Use `ActionController::API` (API-only mode)
- Standard RESTful actions: index, show, create, update, destroy
- Use strong parameters pattern for create/update
- Return appropriate HTTP status codes (200, 201, 204, 400, 404, 500)

## Authentication Patterns

- Use bcrypt `has_secure_password` in User model
- Session-based authentication (no JWT in this project)
- Use `session[:user_id]` for authentication state
- Use `cookies.permanent[:remember_token]` for "remember me" functionality
- Implement `authenticate_user` helper for protected endpoints

## Model Conventions

- Use `ApplicationRecord` as base class
- Define relationships explicitly: `has_many`, `belongs_to`
- Use presence and uniqueness validations
- Foreign keys should have indices for performance

## Error Handling

- Use ErrorsController for 404/500 responses
- Return JSON error responses in format: `{ errors: [...] }`
- Use proper HTTP status codes for errors

## Code Style

- No rubocop configured - follow Rails 7.1 conventions
- RESTful routes only
- Conventional controllers
- bcrypt for password hashing
- No views needed (API-only mode)