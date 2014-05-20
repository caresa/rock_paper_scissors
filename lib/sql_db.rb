class RPS::SQLDB

  def initialize
      @db = SQLite3::Database.new "test.db"

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS users (
          id integer PRIMARY KEY AUTOINCREMENT,
          name string,
          password string,
          );
      SQL

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS game (
          id integer PRIMARY KEY AUTOINCREMENT,
          winner string,
          name string
          FOREIGN KEY(user_id) REFERENCES users(id)
          );
      SQL

      db.execute <<-SQL

        CREATE TABLE IF NOT EXISTS round (
          id integer PRIMARY KEY AUTOINCREMENT,
          move1 string,
          move2 string
          FOREIGN KEY(user_id) REFERENCES users(id)
          );
      SQL


  end


  def build_user(data)
    RPS::Users.new(data[:name], data[:id], data[:password])
  end

  def create_user(data)
    INSERT INTO users(data[:name], data[:id], data[:password])
    VALUES("#{data[:name]} #{data[:id]} #{data[:password]}")
    build_user(data)
  end

  def get_user(id)

  end

  def self.get_users
    SELECT * FROM users
  end

end

