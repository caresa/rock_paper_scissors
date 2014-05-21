class RPS::User

  attr_reader :name, :password

  def initialize(data)
    @name = data[:name]
    @password = data[:password]
  end

  def self.all
    RPS::SQLDB.get_users
  end

end
