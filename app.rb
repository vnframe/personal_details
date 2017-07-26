require "sinatra"
require_relative "sum.rb"

get '/' do
  erb :index
end
post '/name' do
  name = params[:user_name]
  last = params[:last_name]
  redirect '/age?user_name=' + name + '&last_name=' + last
end

get '/age' do
    name = params[:user_name]
    last = params[:last_name]
    erb :get_age, :locals => {:name => name, :last => last}
end
post '/age' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  redirect '/three_numbers?user_name=' + name + '&last' + last + '&age=' + age
end
get '/three_numbers' do
  age = params[:age]
  name = params[:user_name]
  last = params[:last_name]
  erb :three_numbers, :locals => {:name => name, :age => age, :last => last}
end
post '/three_numbers' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  num1 = params[:favenum1]
  num2 = params[:favenum2]
  num3 = params[:favenum3]
  totalnumbers = sum(num1.to_i, num2.to_i, num3.to_i)
  redirect 'total?user_name=' + name + '&last_name=' + last + '&user_age=' + age + '&favenum1=' + num1 + '&favenum2=' + num2 + '&favenum3=' + num3
end
get "/total" do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  num1 = params[:favenum1]
  num2 = params[:favenum2]
  num3 = params[:favenum3]
  totalnumbers = params[totalnumbers]
  erb :total, :locals=>{:name=> name, :last => last, :age=>age, :favenum1=>num1, :favenum2=>num2, :favenum3=>num3, :totalnumbers=>totalnumbers}
end
# post 'total' do
#   age = params[:user_age]
#   name = params[:user_name]
#   num1 = params[:favenum1]
#   num2 = params[:favenum2]
#   num3 = params[:favenum3]
# end
