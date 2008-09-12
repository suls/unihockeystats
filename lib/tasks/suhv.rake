
namespace :suhv do
  desc "Load SUHV devcode and devid"
  task :load_id do
    id = File.open(ENV["HOME"]+"/.suhv_id") { |file| YAML.load(file) }
    ENV["DEV_ID"], ENV["DEV_CODE"] = id[:dev_id].to_s, id[:dev_code].to_s
  end
  
  desc "Store SUHV devcode and devid"
  task :store_id do
    unless ENV.include?("dev_id") && ENV.include?("dev_code")
      raise "usage: rake suhv:store_id dev_id=ID dev_code=CODE" +
            " # replace ID and CODE with your credentials"
    end
    suhv_id = { :dev_id => ENV["dev_id"], :dev_code => ENV["dev_code"]}
    File.open(ENV["HOME"] + "/.suhv_id", "w") do |file|
      YAML.dump(suhv_id, file)
    end
  end
end
