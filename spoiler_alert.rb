require 'yaml'
require 'sinatra'
require "sinatra/reloader" if development?
require 'json'


# Reload spoilers in dev mode
before do
  config_file = File.open('./config/spoilers.yml')
  production? ? SPOILERS ||= YAML::load(config_file) : SPOILERS = YAML::load(config_file)
end

get '/spoiler-topics' do
  SPOILERS.keys.sort.to_json
end

get '/spoilers' do
  SPOILERS.to_json
end

get '/spoilers/:topic' do
  {:spoiler => SPOILERS[params[:topic]] }.to_json
end
