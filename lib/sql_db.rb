require 'sqlite3'
require 'pry-debugger'

class RPS::SQLDB
  attr_reader :db

  def initialize
      @db = SQLite3::Database.new "app.db"

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS users (
          id integer PRIMARY KEY AUTOINCREMENT,
          name string,
          password string,
          );
      SQL

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS match_list (
          id integer PRIMARY KEY AUTOINCREMENT,
          game_id string,
          name string
          game_status string
          FOREIGN KEY(user_id) REFERENCES users(id)
          );
      SQL

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS games (
          id integer PRIMARY KEY AUTOINCREMENT,
          move1 string,
          move2 string,
          player1 string,
          player2 string,
          FOREIGN KEY(user_id) REFERENCES users(id)
          );
      SQL

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS invites (
          id integer PRIMARY KEY AUTOINCREMENT,
          accepted string,
          FOREIGN KEY(user_id) REFERENCES users(id)
          );
      SQL
  end


  def build_user(data)
    RPS::Users.new(data)
  end

  def create_user(data)
    db.execute <<-SQL
      INSERT INTO users(name, password)
      VALUES("#{data[:name]}", "#{data[:password]}")
    SQL
    build_user(data)
  end

  def get_user(id)
   db.execute <<-SQL
      SELECT * FROM users WHERE (id = "#{id}")
    SQL
  end
#which one is better to use
  def self.get_users
    result = @db.execute <<-SQL
    SELECT * FROM users
    SQL
  end

  def get_user_by_name(name)
    db.execute <<-SQL
      SELECT * FROM users WHERE (name = "#{name}")
    SQL
  end

  def create_new_invite(user_id, name)
    db.execute <<-SQL
      INSERT INTO invites(user_id, name)
      VALUES ('#{user_id}', '#{name}');
    SQL
  end
end

