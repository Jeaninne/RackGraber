require 'net/http'
require 'open-uri'
require './parse.rb'

class LinkGraber

 def call(env)# вынести в отдельный класс и вызывать парсер
  request = Rack::Request.new(env)
  #@link=[ request['page_name'] ] #delete that
  parser = Parser.new
  form = parser.find_links(request['page_name'], request['depth'].to_i)
  form.map {|link| link="<a href=#{link}>#{link}</a>"}
  status, headers = 200, {"Content-Type" => "text/html"}
  [status, headers, form]
 end

end
