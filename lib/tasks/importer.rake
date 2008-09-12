
namespace :suhv do
namespace :db do  

  desc "Create seasons from 1997 to this year"
  task :create_seasons => :environment do
    year_1997 = Date.new(1997).year
    
    # TODO what if 2008/09
    this_year = 1.days.ago.year
    
    year_1997.upto(this_year) do |year|
      s = Season.create :year => year, 
                        :description => "Season #{year}/#{year+1}"
                        
      puts "#{s.description} created .."
    end
  end
  
  desc ""
  task :populate_season => :environment do
    if ENV.include?("year")
      year = ENV["year"]
    else
      year = 1.days.ago.year
    end
    puts "using year=#{year}"

  end

end
end
