module RPS
    def self.db
    @__db_instance ||= RPS::SQLDB.new
  end
end

# Require all of our project files
require_relative 'rps/user.rb'
require_relative 'rps/match_list.rb'
require_relative 'commands/sign_in.rb'
require_relative 'rps/invites.rb'
require_relative 'commands/accept_invite.rb'
require_relative 'commands/create_user.rb'
require_relative 'commands/invite_with_name.rb'
require_relative 'commands/match_play_id.rb'
