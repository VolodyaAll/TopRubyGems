require 'yaml'
require 'open-uri'
require 'nokogiri'
require_relative 'parser'

gem_info = {}

options = CommandLineParser.parse(ARGV)

options[:file] ||= 'gems.yml'

gems = YAML.load_file(options[:file])

base_url = 'https://rubygems.org/gems/'

gems['gems'].each do |gem|
  url = base_url + gem
  html = open(url)
  doc = Nokogiri::HTML(html)  
  gem_info[gem] = doc.at_css('[id="code"]')['href']
end

puts gem_info.inspect