require 'net/http'
require 'nokogiri'
require 'open-uri'

class Parser

 def initialize
 end

 def call(env)
   form = find_links('http://kote.dp.ua/', 1)
   status, headers = 200, {"Content-Type" => "text/html"}
   [status, headers, form.collect {|x| x + "\n " }]
 end

 def parse(page_name)
  links = []
  doc = Nokogiri::HTML(open(page_name))
   doc.xpath('//a').each do |link|
   if !((link[:href]=='#') || (link[:href]== nil)) then
     if link[:href].include?('http')
      then links << link[:href]
           end
     end
  end
  links
 end

 def find_links(page_name, depth)
  links_array = parse(page_name)
  if depth > 1 then links_array.each {|page| find_links(page, depth-1) } end
  links_array
 end

end
