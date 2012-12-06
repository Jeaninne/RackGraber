require './graber.rb'
require './parse.rb'

app = Rack::Builder.new do
 use Rack::Reloader

  run Link_graber.new

  map '/parse' do
   run Parser.new
  end
end


Rack::Handler::WEBrick.run app, :Port => 9292

