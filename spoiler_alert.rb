require 'yaml'
require 'sinatra'
require 'json'

SPOILERS = YAML::load( File.open('./config/spoilers.yml') )

get '/' do
  SPOILERS.keys.sort.to_json
end

get '/:topic' do
  # require 'ruby-debug'; debugger
  # params[:topic]
  # content_type :json
  {:spoiler => SPOILERS[params[:topic]] }.to_json
end
