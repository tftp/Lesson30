#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:peregovor.db"


class Messages < ActiveRecord::Base
	validates :title, presence: true
	validates :mess, presence: true
end

class Comments < ActiveRecord::Base
end

class Likes < ActiveRecord::Base
end



get '/' do
	@res_db = Messages.order "created_at DESC"
	erb :welcome		
end

get '/message' do
	@c=Messages.new
	erb :message		
end

post '/message' do
	@c=Messages.new params[:message]
	@c.ip_adress = request.ip
	if @c.save
		redirect to '/'
	else
		@error=@c.errors.full_messages.first
		erb :message
	end

end

get '/post/:post_id' do
	res_db = Messages.where "id=#{params[:post_id]}"
	@res = res_db[0]
#	@c=Comments.new params[:comments]
	
	erb :post
	
	
end
