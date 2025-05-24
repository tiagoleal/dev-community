# 🚀 DevCommunity - Developer Portfolio

DevCommunity is a **Rails 7** application that enables developers to create and showcase their portfolios. Users can follow other developers, engage with their content, and build a professional network.

## 🌟 Features

- 🏗 **Developer Portfolio:** Create and manage your portfolio with projects, skills, and experiences.
- 🔗 **Follow System:** Follow developers and explore their work in real time.
- ⚡ **Hotwire-Powered UI:** Instant updates without full-page reloads using **Turbo & Stimulus**.
- 🔒 **Secure Authentication:** User authentication via **Devise**.
- ✅ **Comprehensive Testing Suite:** Automated tests with **RSpec, Capybara, and Selenium** for robust application reliability.

## 🛠 Tech Stack

- **Backend:** Ruby on Rails 7
- **Frontend:** Hotwire (Turbo & Stimulus)
- **Database:** PostgreSQL
- **Authentication:** Devise
- **Testing:** RSpec, Capybara, Selenium

## 🖼️ Screenshot
![](https://github.com/tiagoleal/dev-community/tree/master/public/dev-community.gif)

## 📦 Installation

1. Clone the repository:
   ```sh
   git clone git@github.com:tiagoleal/dev-community.git
   cd dev-community
   ```
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Setup database:
   ```sh
   rails db:create db:migrate db:seed
   ```
4. Start the server:
   ```sh
   rails s
   ```
5. Access the app at **`http://localhost:3000`**

## 🧪 Running Tests

Run the test suite with:
```sh
rspec
```
For system tests (Capybara + Selenium):
```sh
bundle exec rspec spec
```
## 👨‍💻 Authors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
[<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br />

