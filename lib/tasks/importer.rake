
namespace :suhv do
namespace :db do  

  desc "Create seasons from 1997 to this year"
  task :create_seasons => :environment do
    year_1997 = DateTime.new(1997).year
    
    # TODO what if 2008/09
    this_year = DateTime.now.year
    
    old_count = Season.count
    year_1997.upto(this_year) do |year|
      s = Season.find_or_create_by_year_and_description :year => year, 
                        :description => "Season #{year}/#{year+1}"
    end
    new_count = Season.count
    puts "#{new_count - old_count} Seasons created. #{new_count} now exist."
  end
  
  desc "Populate fixture for the season in the current year " +
       "(#{DateTime.now.year}) or otherwise " +
       "specified. (rake suhv:db:populate_season year=XXXX)" 
  task :populate_season => [:environment, 
                            "suhv:db:create_seasons", 
                            "suhv:load_id"] do
    if ENV.include?("year")
      year = ENV["year"]
    else
      year = DateTime.now.year
    end
    season = Season.find_by_year year

    puts "Populating Season: #{season.description} .."
    dev_id, dev_code = ENV["DEV_ID"].dup, ENV["DEV_CODE"].dup
    # stats = Hash.new { |hash, key| hash[key] = Hash.new { |h, k| h[k] = 0 } }

    request = SUHV::League.new    
    
    # TODO full size
    100.upto(120) do |league_code|
      1.upto(40) do |group_num|
        resp = request.gamesLeague(dev_id, dev_code, 0,
                                   season.year, league_code, group_num, 0)
                                   
        next if resp.games.size == 0
        
        season_league = SeasonLeague.find_by_season_and_league_code(season, 
                                                                  league_code)
                                                                  
        unless !!season_league  
          season_league = SeasonLeague.create(:league_code => league_code,
                                              :season => season)
        end
        
        group = Group.find_by_season_league_and_number(season_league, 
                                                        group_num)
        unless !!group  
          group = Group.create(:number => group_num, 
                              :season_league => season_league)
        end
        
        print "."
      end
      print "\n"
    end
    
    # puts 
    # p stats
    
    puts ".. done"
  end

end
end
