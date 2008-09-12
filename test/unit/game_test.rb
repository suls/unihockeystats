require 'test_helper'

class GameTest < ActiveSupport::TestCase

  def test_home_and_away_team_relationship
    g = Game.create
    st1 = SeasonTeam.create :name => "Chrigi's team"
    st2 = SeasonTeam.create :name => "Suls' team"
    
    g.home_season_team = st1
    g.away_season_team = st2
    
    g.save!
    
    assert_equal(st1.home_games.first, g)
    assert_equal(st2.away_games.first, g)
    
  end
  
end
