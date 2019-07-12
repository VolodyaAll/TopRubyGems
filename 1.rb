require 'open-uri'
require 'nokogiri'
require 'json'

url = 'https://rubygems.org/gems/rails'
html = open(url)

doc = Nokogiri::HTML(html)

puts doc.at_css('[id="code"]')['href']
