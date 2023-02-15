# Sales Importer

Sales Importer is a simple importer made with Rails 7.0.4.2 to import a sale file tab separated.

## Installation

### Dependencies

- Ruby 3.2.0
- Rails 7.0.4.2
- MySQL 8.0.32

#### 1. Check out the repository

```bash
git@github.com:devitcabelo/sales_importer.git
```

#### 2. Edit database.yml file

Edit the database configuration to your local settings.

```bash
config/database.yml
```

#### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rake db:create
rake db:migrate
```

#### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```


And now you can visit the site with the URL http://localhost:3000

#### 5. Tests

You can test the application by running the command given below.

```ruby
rspec
```