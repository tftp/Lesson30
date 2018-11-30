#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:peregovor.db"


class Messages < ActiveRecord::Base
end

class Comments < ActiveRecord::Base
end

class Likes < ActiveRecord::Base
end



get '/' do
	erb :welcome		
end

get '/message' do
	erb :message		
end



