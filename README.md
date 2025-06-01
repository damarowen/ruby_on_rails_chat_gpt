```markdown
# 💬 ChatGPT Clone - Ruby on Rails (No DB, One-User Auth)

This is a simple Ruby on Rails application that mimics ChatGPT-like chatting behavior. It connects to the OpenAI API using a single-user password, and **does not use a database**.

---

## 🚀 Features

- 🔐 Simple one-account login (no database)
- 🧠 Connects to OpenAI API (GPT-3.5 or GPT-4)
- 💬 Chat UI with prompt + response
- 💎 Built with Rails (API-optional)
- ❌ No history, no database, no registration

---

## 🛠️ Getting Started

### 1. Install dependencies

Make sure you have:

- Ruby (3.1+)
- Bundler (`gem install bundler`)
- Rails (`gem install rails`)
- Node.js & Yarn (for frontend assets)
- OpenAI API Key

### 2. Setup project

```bash
bundle install
```

Create a `.env` file in the project root:

```env
OPENAI_API_KEY=your_openai_api_key_here
```

### 3. Start the server

```bash
rails server
```

Visit: [http://localhost:3000](http://localhost:3000)

Login with:
```
Password: secret123
```

---

## 📁 Project Structure

```
chatgpt_clone/
├── app/                # Main logic (controllers, views, assets)
│   └── controllers/    # Request logic (ChatController handles input/output)
│   └── views/          # ERB templates for UI
│
├── config/             # Routing & app config
│   └── routes.rb       # URL → Controller mapping
│
├── public/             # Static files (favicon, etc)
├── log/                # Application logs
├── bin/                # Rails boot scripts
├── tmp/                # Temp files (auto-generated)
├── vendor/             # Optional 3rd-party libs
│
├── .env                # Your OpenAI API key (not committed)
├── Gemfile             # Project dependencies (like package.json)
├── Gemfile.lock        # Locked gem versions
├── Dockerfile          # (Optional) Docker support
├── .gitignore          # Files Git should ignore
└── README.md           # This file
```

---

## ⚠️ Notes

- This project **does not use ActiveRecord** (no DB).
- History is not stored.
- Password is hardcoded (`secret123`) for simplicity.

---

## 📦 Example API Flow

```http
POST /chat
Content-Type: application/json

{
  "prompt": "What is Ruby on Rails?",
  "password": "secret123"
}
```

Response:

```json
{
  "reply": "Ruby on Rails is a server-side web application framework..."
}
```

---

## 🧠 Future Ideas

- Add chat history using Redis or session
- Add streaming responses
- Integrate WebSockets for real-time chat
- Use React frontend for dynamic UI

---

## 🧑‍💻 Author

Built with ❤️ by [Your Name]
```
