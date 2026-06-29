# NMSCST Asset Management System

The **NMSCST Asset Management System** is a web-based application developed to help manage institutional assets efficiently. The system provides modules for asset tracking, inventory management, location management, report generation, and an integrated AI Assistant powered by a local Large Language Model (LLM) using Ollama.

---

# System Requirements

Before running the application, ensure that you have the following installed:

* PHP 8.2 or later
* Composer
* Node.js and npm
* MySQL
* Git (optional, for cloning the repository)
* A web solution stack (XAMPP, Laragon, WAMP, etc.)
* Ollama (for the AI Assistant)

---

# Installation Guide

## Step 1 — Install a Web Solution Stack

Install a web solution stack such as:

* XAMPP
* Laragon
* WAMP
* Any preferred local development environment

> **Note:** You may skip this step if you already have a web solution stack installed.

---

## Step 2 — Download or Clone the Repository

Clone the repository using Git:

```bash
git clone <Repository-Link>
```

or download the ZIP file and extract it.

Replace `<Repository-Link>` with the actual repository URL.

---

## Step 3 — Transfer the Project Folder

Move the project folder:

```
nmscst_asset_management
```

to one of the following directories depending on your environment:

### XAMPP

```
xampp/htdocs/
```

### Laragon

```
laragon/www/
```

If you are using another web solution stack, place the project inside its corresponding web root directory.

---

## Step 4 — Create the Database

Open your preferred database management tool (such as phpMyAdmin).

Create a new MySQL database named:

```
nmscst_asset_db
```

Then import the SQL file located inside the project's **database** folder.

> **Note:** If you prefer using a clean database instead of the provided SQL file, proceed directly to **Step 6**.

---

## Step 5 — Open the Project

Open your preferred IDE (Visual Studio Code, PhpStorm, etc.) and load the project folder:

```
nmscst_asset_management
```

---

## Step 6 — Create a Fresh Database (Optional)

If you prefer a clean database, execute the following Artisan commands:

```bash
php artisan migrate:fresh
```

To migrate the database and populate it with sample data:

```bash
php artisan migrate:fresh --seed
```

These commands will recreate all database tables and insert sample records.

> **Important:** Running these commands resets the database. Any existing accounts, including the default login credentials provided in the imported SQL file, will be removed. If necessary, create new user accounts or update the database manually.

---

## Step 7 — Install Ollama

Install Ollama from its official website.

After installation, download a text-based model.

Recommended model:

```
llama3.1:8b
```

You may use any text-based model supported by Ollama, but **llama3.1:8b** is recommended for the best balance of performance and resource usage.

---

## Step 8 — Start the Ollama Service

Open PowerShell or your preferred terminal and execute:

```bash
ollama serve
```

> **Note:** Ensure that no other Ollama instance is currently running, as multiple services may conflict over the default port.

If using the recommended model, verify it is available:

```bash
ollama list
```

If it has not been downloaded yet:

```bash
ollama pull llama3.1:8b
```

---

## Step 9 — Run the Application

Install the project dependencies:

```bash
composer install
```

```bash
npm install
```

Copy the environment file:

```bash
cp .env.example .env
```

Generate the application key:

```bash
php artisan key:generate
```

Start the Laravel development server:

```bash
php artisan serve
```

In another terminal, start Vite:

```bash
npm run dev
```

Open your browser and visit:

```
http://127.0.0.1:8000
```

or

```
http://localhost/nmscst_asset_management/public
```

depending on your setup.

Log in using the provided credentials or create a new account if using a freshly migrated database.

---

# AI Assistant

The system includes an integrated AI Assistant that utilizes a locally hosted Large Language Model through Ollama.

The assistant can help users by:

* Searching for assets
* Counting assets
* Listing categories
* Finding locations
* Displaying inventory statistics
* Answering asset-related questions using natural language

Ensure that the Ollama service is running before using the AI Assistant.

---

# Technologies Used

* Laravel 12
* Vue 3
* Inertia.js
* TypeScript
* Tailwind CSS
* ShadCN Vue
* MySQL
* Ollama
* Local Large Language Models (LLMs)

---

# Project Structure

```
app/
├── Http/
├── Models/
├── Services/
│   └── AI/
│       ├── AgentService.php
│       ├── ChatService.php
│       ├── IntentExtractor.php
│       ├── OllamaService.php
│       ├── PromptBuilder.php
│       ├── AssetRetriever.php
│       └── Tools/
resources/
routes/
database/
public/
```

---

# Troubleshooting

### AI Assistant is not responding

* Verify that Ollama is running.
* Ensure the selected model has been downloaded.
* Confirm that the configured model name matches the one installed.
* Check that no other Ollama service is using the default port.

### Database connection errors

* Verify the database credentials in the `.env` file.
* Confirm that the MySQL server is running.
* Ensure the `nmscst_asset_db` database exists.

### Vite assets are not loading

Run:

```bash
npm install
```

then:

```bash
npm run dev
```

---

# License

This project was developed for academic purposes as part of the **NMSCST Asset Management System**.
