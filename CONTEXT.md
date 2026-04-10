# Ruby on Rails API - Context

## Project Overview

Rails 7.1 API-only application that serves as a backend REST API for a prompt management system. Users can create prompts with tags, and belong to groups.

## Technology Stack

| Component | Technology |
|-----------|------------|
| Framework | Rails 7.1.3+ |
| Ruby Version | 3.3.4 |
| Database | SQLite3 (~> 1.4) |
| Web Server | Puma (>= 5.0) |
| Caching | Rack-Cache |
| HTTP Client | Faraday |
| Authentication | bcrypt |

## Database Schema

### Tables

**users**
- `email` (string) - unique, required
- `username` (string) - unique, required
- `image` (string) - required
- `password_digest` (string) - for bcrypt authentication

**prompts**
- `tag` (string) - required
- `username` (string)
- `image` (string)
- `content` (string) - required
- `user_id` (integer) - foreign key to users, required

**groups**
- `name` (string)

### Relationships

```
User (1) ----< (many) Prompt
```

## API Endpoints

| Method | Path | Controller#Action | Purpose |
|--------|------|-------------------|---------|
| GET | `/groups` | GroupsController#index | List all groups |
| GET | `/groups/:id` | GroupsController#show | Get single group |
| POST | `/groups` | GroupsController#create | Create group |
| PATCH/PUT | `/groups/:id` | GroupsController#update | Update group |
| DELETE | `/groups/:id` | GroupsController#destroy | Delete group |
| GET | `/prompts` | PromptsController#index | List all prompts |
| GET | `/prompts/:id` | PromptsController#show | Get single prompt |
| POST | `/prompts` | PromptsController#create | Create prompt |
| PATCH/PUT | `/prompts/:id` | PromptsController#update | Update prompt |
| DELETE | `/prompts/:id` | PromptsController#destroy | Delete prompt |
| POST | `/users` | UsersController#create | Create user (registration) |
| POST | `/login` | SessionsController#create | Login |
| DELETE | `/logout` | SessionsController#destroy | Logout |
| GET | `/errors/not_found` | ErrorsController#not_found | 404 handler |
| GET | `/errors/internal_server_error` | ErrorsController#internal_server_error | 500 handler |
| GET | `/up` | Rails::Health#show | Health check |
| GET | `/groups/download` | GroupsController#download | Download image file |

## Models

**User**
- `has_secure_password`
- `has_many :prompts`
- Validates: email (presence, uniqueness), password (presence), username (presence, uniqueness), image (presence)

**Prompt**
- `belongs_to :user`
- Validates: content (presence), tag (presence)

**Group**
- Empty model with no associations defined

## Authentication

Session-based authentication using bcrypt `has_secure_password`. The implementation is minimal and incomplete:

- Password hashing via bcrypt
- Login checks email/password, sets `session[:user_id]` or `cookies.permanent[:remember_token]` if "remember_me" is passed
- Logout deletes session

**Note:** No JWT tokens, no token-based authentication for API endpoints, and no authorization middleware. The Prompts and Groups controllers have NO authentication checks.

## Known Issues

1. **CRUD incomplete**: Only users "create" exists; no Read/Update/Delete for users
2. **Reference lookups missing**: Client passes user_id directly instead of server-side lookups
3. **No authentication validation**: Zero auth implemented despite having bcrypt
4. **Code cruft**: Needs cleanup from Rails scaffold generation

## Dev Scripts

- `app/scripts/http_requests.rb` - Helper script for testing API with Faraday