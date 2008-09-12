
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
  task :populate_season => :environment do
    if ENV.include?("year")
      year = ENV["year"]
    else
      year = DateTime.now.year
    end
    season = Season.find_by_year year
    puts "Populating Season: #{season.description} .."
    puts ".. done"
  end

end
end
