require "sinatra"
require_relative "sum.rb"

get '/' do
  erb :index
end
post '/name' do
  name = params[:user_name]
  redirect '/age?user_name=' + name
end

get '/age' do
    name = params[:user_name]
    erb :get_age, :locals => {:name => name}
end
post '/age' do
  age = params[:user_age]
  name = params[:user_name]
  redirect '/three_numbers?user_name=' + name + '&age=' + age
end
get '/three_numbers' do
  age = params[:age]
  name = params[:user_name]
  erb :three_numbers, :locals => {:name => name, :age => age}
end
post '/three_numbers' do
  age = params[:user_age]
  name = params[:user_name]
  num1 = params[:favenum1]
  num2 = params[:favenum2]
  num3 = params[:favenum3]
  totalnumbers = sum(num1.to_i, num2.to_i, num3.to_i)
  redirect '/total?user_name=' + name + '&user_age=' + age + '&favenum1=' + num1 + '&favenum2=' + num2 + '&favenum3=' + num3
end
get "/total" do
  age = params[:user_age]
  name = params[:user_name]
  num1 = params[:favenum1]
  num2 = params[:favenum2]
  num3 = params[:favenum3]
  totalnumbers = params[totalnumbers]
  erb :total, :locals=>{:name=> name, :age=>age, :favenum1=>num1, :favenum2=>num2, :favenum3=>num3, :totalnumbers=>totalnumbers}
end
# post 'total' do
#   age = params[:user_age]
#   name = params[:user_name]
#   num1 = params[:favenum1]
#   num2 = params[:favenum2]
#   num3 = params[:favenum3]
# end
