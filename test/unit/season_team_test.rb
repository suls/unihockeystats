require 'test_helper'

class SeasonTeamTest < ActiveSupport::TestCase
  
  def test_show_all_games
    st = SeasonTeam.create

    1.upto(10) do |n|
      g = Game.create
      if n % 2 == 0
        g.home_season_team = st
      else
        g.away_season_team = st
      end 
      g.save!
    end
    
    assert_equal(10, st.games.size)
    
    assert_equal(5, st.home_games.size)
    assert_equal(5, st.away_games.size)
  end
end
