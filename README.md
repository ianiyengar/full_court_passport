# Full Court Passport

Full Court Passport is a Ruby on Rails app for NBA fans who want to track every arena they have visited.

The idea is simple: browse all 30 current NBA arenas, view arena details and photos, and eventually create a personal “passport” where you can mark arenas as visited, rate your experience, and track progress toward visiting all 30.

This project is currently in early development and is being built incrementally from scratch.

---

## Current Features

As of now, the app includes:

- A Ruby on Rails backend
- PostgreSQL database
- Seeded data for all 30 current NBA arenas
- Arena index page
- Arena show page
- Local arena images stored in `app/assets/images`
- Tailwind-based card layout for cleaner presentation

The current version is focused on getting the core arena data and visual experience in place before moving into authentication and user-specific features.

---

## Planned Features

The long-term goal for Full Court Passport is to let users build their own NBA arena travel log.

Planned features include:

- User sign up / login / logout
- User profiles
- Mark an arena as visited
- Store visit date
- Give each arena a personal rating
- Add notes or memories from each visit
- Track progress, such as:
  - number of arenas visited
  - percentage complete
  - remaining arenas
- Arena “passport” or checklist experience
- Potential swipe-based arena browsing UI
- Potential React frontend enhancements later
- Optional arena ranking list for each user
- Optional image uploads for personal visit photos

---

## Tech Stack

### Backend
- Ruby 3.1.3
- Rails 7.2.3.1
- PostgreSQL

### Frontend
- ERB views
- Tailwind CSS
- CSS build via Tailwind CLI
- esbuild installed for JavaScript bundling support

### Current JavaScript / CSS tooling
- `tailwindcss`
- `@tailwindcss/cli`
- `esbuild`
- Yarn

---

## Current Data Model

### Team
Stores NBA team information.

### Arena
Stores arena details, including:
- arena name
- team
- city
- state
- capacity
- first NBA season
- description
- image support

### Visit
Planned, but not fully active yet.

This model is intended to connect a user to an arena visit and eventually store:
- visit date
- rating
- notes

### User
Planned for a future version.

Authentication is expected to be added later.

---

## Project Status

This app is currently in active early development.

Working:
- Rails app setup
- database setup
- seeded arena and team data
- arena image assets
- arena list rendering
- arena detail pages

Not implemented yet:
- users
- login/authentication
- visits
- ratings
- personal arena progress tracking

---

## Installation

### 1. Clone the repo and run the following commands

```bash
git clone <your-repo-url>
cd full_court_passport
bundle install
yarn install
yarn add -D tailwindcss @tailwindcss/cli esbuild
rails db:create
rails db:migrate
rails db:seed
yarn build:css
rails server

### Visit the site on your localhost
http://localhost:3000