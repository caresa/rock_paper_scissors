require_relative '../rps.rb'

class RPS::InviteWithName
  def run(user_id, name)
    user = RPS::SQLDB.get_user_by_name
    response = RPS::SQLDB.create_new_invite(user_id, user[0][0])
  end
end
