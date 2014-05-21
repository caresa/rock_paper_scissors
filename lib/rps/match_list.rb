class RPS::MatchList

  attr_reader :name, :password

  def initialize(data)
    @game_id = data[:game_id]
    @name = data[:name]
    @game_status = data[:game_status]
  end

  def all
    RPS::SQLDB.get_match_list
  end

end
