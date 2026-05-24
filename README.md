# know-your-sql

### Required Setup for CI/CD

**Set the PostgreSQL password as a GitHub Actions secret (do not hardcode it):**

- Go to your repository on GitHub
- Navigate to **Settings > Secrets and variables > Actions**
- Click **New repository secret**
- Name it `POSTGRES_PASSWORD` and set the value to your desired password (choose a strong password; do not hardcode it in code or config files)

This secret is used by the CI workflow to provision the test database securely. For local Docker usage, you can set the password via an environment variable or a `.env` file:

```bash
# .env example (do not commit this file)
POSTGRES_PASSWORD=your_strong_password_here
```

Then run Docker with:

```bash
docker run --env-file .env -p 5432:5432 know-your-sql:dev
```

Or set the variable directly:

```bash
docker run -e POSTGRES_PASSWORD=your_strong_password_here -p 5432:5432 know-your-sql:dev
```

## Containerization & Deployment

This repo supports containerized development and production environments using Docker.

### Build and Run Locally

- **Development:**
  ```bash
  docker build -f Dockerfile -t know-your-sql:dev .
  # Recommended: use a .env file or environment variable, not a hardcoded password
  docker run --env-file .env -p 5432:5432 know-your-sql:dev
  # Or
  docker run -e POSTGRES_PASSWORD=your_dev_password -p 5432:5432 know-your-sql:dev
  ```
- **Production:**
  ```bash
  docker build -f Dockerfile.prod -t know-your-sql:prod .
  # Recommended: use a .env file or environment variable, not a hardcoded password
  docker run --env-file .env -p 5432:5432 know-your-sql:prod
  # Or
  docker run -e POSTGRES_PASSWORD=your_prod_password -p 5432:5432 know-your-sql:prod
  ```

### Automated Docker Hub Deployment

On every push and pull request, the CI/CD workflow will:

- Build both dev and prod images
- Push them to Docker Hub as:
  - `${{ secrets.DOCKERHUB_USERNAME }}/know-your-sql:dev`
  - `${{ secrets.DOCKERHUB_USERNAME }}/know-your-sql:prod`

**Note:** You must set `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` as GitHub Actions secrets for this to work.

See [Dockerfile](Dockerfile), [Dockerfile.prod](Dockerfile.prod), and the workflow [db-schema.yml](.github/workflows/db-schema.yml) for details.

---

Practice SQL datasets and exercises for MySQL and PostgreSQL

## Project Structure

- mysql/: MySQL-compatible datasets
- psql/: PostgreSQL-compatible datasets (with schema support)
- exercises/:
  - ecommerce/: Questions for the ecommerce dataset
  - human-resource/: Questions for the HR join practice dataset
  - enrollment/: Questions for the university enrollment dataset

## Usage

### MySQL

1. Start MySQL and create a database (e.g., `ecommercedb`).
2. Import a dataset:
   ```bash
   mysql -u root -p ecommercedb < mysql/ecommerce.sql
   mysql -u root -p enrollmentdb < mysql/enrollment.sql
   mysql -u root -p human_resource_db < mysql/human_resource.sql
   ```

### PostgreSQL

1. Create the database and connect:
   ```bash
   psql -U postgres -f < psql/ecommerce.sql
   psql -U postgres -f < psql/enrollment.sql
   psql -U postgres -f < psql/human_resource.sql
   ```

## Datasets

- **ecommerce**: Users, employees, products, orders (for filtering, joins, analytics)
- **human_resource**: Departments, employees, salaries, projects, attendance (for join and HR analytics)
- **enrollment**: Students, courses, enrollments (for school/university practice)

## Exercises & Solutions

- See exercises/ecommerce/questions.md
- See exercises/human-resource/questions.md
- See exercises/enrollment/questions.md

## .gitignore

Project includes a .gitignore for Python, VS Code, SQL logs, and backup files.

## Repository Name

**know-your-sql**

---

## Useful MySQL Commands

- `SHOW DATABASES;` — List all databases
- `USE dbname;` — Switch to a database
- `SHOW TABLES;` — List all tables in the current database
- `DESCRIBE tablename;` — Show table structure
- `SHOW COLUMNS FROM tablename;` — List columns in a table
- `SOURCE filename.sql;` — Execute SQL commands from a file
- `EXIT;` or `QUIT;` — Exit MySQL
- `\! clear` — Clear the terminal screen
- `STATUS;` — Show connection and server info
- `HELP;` — Show help for MySQL commands

## Useful psql Commands

- `\l` — List all databases
- `\c dbname` — Connect to a database
- `\dt` — List all tables in the current schema
- `\d tablename` — Describe a table's structure
- `\dn` — List all schemas
- `\du` — List all roles/users
- `\df` — List all functions
- `\x` — Toggle expanded output (useful for wide tables)
- `\q` — Quit psql
- `\i filename.sql` — Execute SQL commands from a file
- `\timing` — Toggle query execution time display
- `\?` — Show all psql commands
- `\r` - Refresh terminal
- `g` - View top output
- `G` - View bottom output
- `Space` - View next output

Practice, learn, and master SQL with real-world datasets and query challenges!
