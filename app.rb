require 'sinatra'
require 'yaml'
require 'json'
require 'motto'

set :motto, Motto.new

get '/motto' do
  headers site_headers
  {motto: settings.motto.sample}.to_json
end

get '/motto/:category' do
  headers site_headers
  category = params[:category].downcase
  if settings.motto.categories.include? category
    {motto: settings.motto.category(category)}.to_json
  else
    status 404
    {ERROR: "Not Found category: #{category}"}.to_json
  end
end


def site_headers
  {"Access-Control-Allow-Origin" => 'http://ops.conac.cn'}
end



