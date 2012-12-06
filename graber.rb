require 'net/http'
require 'nokogiri'
require 'open-uri'

class Link_graber

 def initialize
 end

  def call(env)
    form = <<html
<!DOCTYPE html>
<html>
<head>
  <title>Blog</title>
</head>
<body style="background: #EEEEEE;"> 
 <form>
    <p>
    Enter site: <input type="text" name="page_name"><br>
    Enter depth: <input type="text" name="depth"><br>
    <input type="submit" value="parse it!" action="action.html" method="get">
    </p>
 </form>
</body>
</html>
html

    status, headers = 200, {"Content-Type" => "text/html"}
    [status, headers, [form]]
  end




#  def #blyad
#    #page_name
#  end

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
  File.open('data.txt', 'a'){ |file| file.puts  "#{depth} depht. Links on #{page_name}:" }
  links_array = parse(page_name)
  if depth > 1 then
   links_array.each {|page| find_links(page, depth-1)
    }#write on page
  else links_array.each {|page| } #write on page
   end
 end

end

