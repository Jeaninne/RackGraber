require './graber.rb'

app = Rack::Builder.new do
 use Rack::Reloader

  run Link_graber.new

  map '/e' do
   run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["kjbhklb"]] }
  end
end


Rack::Handler::WEBrick.run app, :Port => 9292

