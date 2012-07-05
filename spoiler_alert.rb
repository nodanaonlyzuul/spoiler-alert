require 'yaml'
require 'sinatra'
require "sinatra/reloader" if development?
require 'json'


# Reload spoilers in dev mode
before do
  config_file = File.open('./config/spoilers.yml')
  production? ? @spoilers ||= YAML::load(config_file) : @spoilers = YAML::load(config_file)
end

get '/spoiler-topics' do
  @spoilers.keys.sort.to_json
end

get '/spoilers' do
  @spoilers.to_json
end

get '/spoilers/:topic' do
  {:spoiler => @spoilers[params[:topic]] }.to_json
end
