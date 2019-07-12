class CommandLineParser
    def self.parse(args)
      options = {}
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: top_gems.rb"
  
        opts.on("-tTOP", "--top=INTEGER", Integer, "Shows the number of gems according to the rating") do |t|
          options[:top] = t
        end
      
        opts.on("-nNAME", "--name=WORD", "Displays all the Gems according to the rating in the name of which includes the given word") do |n|
          options[:name] = n
        end
      
        opts.on("-fFILE", "--file=Path_to_Filename.yml", /([a-zA-Z0-9\s_\\.\-\(\):])+.yml$/, "Path to the .yml file containing the list of gem names") do |f|
          options[:file] = f[0]
        end
      
        opts.on("-h", "--help", "Prints this help") do
          puts opts
        end
      end
  
      begin
        opts.parse(args)
      rescue Exception => e
        puts "Exception encountered: #{e}"
        opts.parse %w[--help]
        exit 1
      end
  
    options
  end
end