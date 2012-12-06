require './graber.rb'
require './parse.rb'

use Rack::Reloader

 run Link_graber.new

 map '/parse' do
  run Parser.new
 end
