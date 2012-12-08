require 'net/http'
require 'nokogiri'
require 'open-uri'

class Parser

attr_accessor :link
 def initialize
  @link=[]
 end

 def parse(page_name)
  array_of_parsed_links = []
  doc = Nokogiri::HTML(open(page_name))
   doc.xpath('//a').each do |link|
   if !((link[:href]=='#') || !(link[:href].nil?)) then
     if link[:href].include?('http')
      then array_of_parsed_links << link[:href]  end
   end
  end
  array_of_parsed_links
 end

 def find_links(page_name, depth)
  unless @link.include? page_name 
   links_array = parse(page_name)
   if depth > 1 then links_array.each {|page| find_links(page, depth-1) } end
   @link += links_array
  end
  @link
 end

end
