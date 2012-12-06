require './graber.rb'

app = Rack::Builder.new do
 use Rack::Reloader

  run Link_graber.new

  map '/parse' do
   run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["input.page_name?"]] }
  end
end


Rack::Handler::WEBrick.run app, :Port => 9292

