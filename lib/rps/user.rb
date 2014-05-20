class RPS::Users

  attr_reader :name, :password

  def initialize(data)
    @name = data[:name]
    @password = data[:password]
  end

  def all
    RPS::SQLDB.get_users
  end

end
