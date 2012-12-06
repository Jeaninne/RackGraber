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
  <title>Crawling</title>
</head>
<body style="background: #eee;"> 
 <form name="input" action="parse" method="get">
    <p>
    Enter site: <input type="text" name="page_name"><br>
    Enter depth: <input type="text" name="depth"><br>
    <input type="submit" value="parse it!">
    </p>
 </form>
</body>
</html>
html

    status, headers = 200, {"Content-Type" => "text/html"}
    [status, headers, [form]]
  end

end

