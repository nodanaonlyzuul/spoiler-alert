require 'yaml'
require 'sinatra'
require 'json'


# Reload spoilers in dev mode
before do
  if (settings.environment != :production)
    SPOILERS = YAML::load( File.open('./config/spoilers.yml'))
  else
    SPOILERS ||= YAML::load( File.open('./config/spoilers.yml') )
  end
end

get '/' do
  SPOILERS.keys.sort.to_json
end

get '/:topic' do
  {:spoiler => SPOILERS[params[:topic]] }.to_json
end
