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
	@res_db = Messages.all
	erb :welcome		
end

get '/message' do
	erb :message		
end

post '/message' do
	@c=Messages.new params[:message]
	@c.ip_adress = request.env['HTTP_X_REAL_IP']
	if @c.save
		erb "Спасибо за Ваш заказ, мы свяжемся с Вами в ближайшее время."
	else
		@error=@c.errors.full_messages.first
		erb :message
	end

end

