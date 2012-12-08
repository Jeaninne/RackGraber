require 'net/http'
require 'open-uri'

class FirstForm

 def call(env)
    form = main_form
    status, headers = 200, {"Content-Type" => "text/html"}
    [status, headers, [form]]
  end

 def main_form
<<html
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
 end

end

