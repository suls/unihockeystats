class SeasonLeague < ActiveRecord::Base
  belongs_to :league
  belongs_to :season
  
  has_many :groups
end
