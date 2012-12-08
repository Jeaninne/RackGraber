require './index.rb'
require './linkgraber.rb'

use Rack::Reloader

 run FirstForm.new

 map '/parse' do
  run LinkGraber.new
 end
