require 'sinatra'
require 'sinatra/cookies'
#require 'active/support/all'
require_relative "lib/picas_fijas_oop"

get '/' do
  fp = PicasFijas.new
  fp.generate_number
  response.set_cookie(:number, value: fp.guessed_number)
#  fp.format_user_number(1234.to_s)
  fp.fijas_picas
  @fijas= fp.fijas
  @picas= fp.picas
  @show = "hidden"
  erb :index
end

get '/winner' do
  erb :winner
end

post '/' do
  # table = table + params[:user_number] + '-' + fp.fijas + '-'
  fp2 = PicasFijas.new
  fp2.format_cookie_number(cookies[:number])####TODO
  fp2.format_user_number(params[:user_number])
  fp2.fijas_picas
  @show = nil
  @fijas = fp2.fijas
  @picas = fp2.picas
  # intento = intento + params[:user_number] + '-' + fp2.fijas.to_s + '-' + fp2.picas.to_s + ','
  # response.set_cookie(:table, value: intento )
  if fp2.fijas == 4
    @user_number = params[:user_number]
    cookies.delete(:number)
    erb :winner
  else
    erb :index
  end
end
