require_relative '../rps.rb'

class RPS::SignIn
  def run(data)
    response = RPS::SQLDB.get_user_by_name(name)
    if response[0].last == data[:password]
      return {:success? => true, :message => "Login successful!" }
    else
      return {:success? => false, :message => "Incorrect password!"}
    end
  end
end
