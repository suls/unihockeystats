
namespace :suhv do
namespace :db do  

  desc "Create seasons from 1997 to this year"
  task :create_seasons => :environment do
    year_1997 = DateTime.new(1997).year
    
    # TODO what if 2008/09
    this_year = DateTime.now.year
    
    year_1997.upto(this_year) do |year|
      s = Season.create :year => year, 
                        :description => "Season #{year}/#{year+1}"
                        
      puts "#{s.description} created .."
    end
  end
  
  desc "Populate fixture for the season in the current year " +
       "(#{DateTime.now.year}) or otherwise " +
       "specified. (rake suhv:db:populate_season year=XXXX)" 
  task :populate_season => [:environment, "suhv:load_id"] do
    if ENV.include?("year")
      year = ENV["year"]
    else
      year = DateTime.now.year
    end
    season = Season.find_by_year year

    puts "Populating Season: #{season.description} .."
    dev_id, dev_code = ENV["DEV_ID"].dup, ENV["DEV_CODE"].dup
    stats = Hash.new { |hash, key| hash[key] = Hash.new { |h, k| h[k] = 0 } }

    request = SUHV::League.new    
    
    100.upto(120) do |league_code|
      1.upto(100) do |group_num|
        resp = request.gamesLeague(dev_id, dev_code, 0,
                                   season.year, league_code, group_num, 0)
        break if resp.games.size == 0
        
        season_league = SeasonLeague.find_by_season_and_league_code(season, 
                                                                  league_code)
                                                                  
        unless !!season_league  
          season_league = SeasonLeague.create(:league_code => league_code,
                                              :season => season)
          stats[:season_league][:new] += 1
        else
          stats[:season_league][:old] += 1
        end
        group = Group.find_by_season_league_and_number(season_league, 
                                                        group_num)
        unless !!group  
          group = Group.create(:number => group_num, 
                              :season_league => season_league)
          stats[:group][:new] += 1
        else
          stats[:group][:old] += 1
        end
      end
    end
    
    # puts 
    p stats
    
    puts ".. done"
  end

end
end
