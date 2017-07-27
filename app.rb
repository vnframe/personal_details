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
  redirect '/haircolor?user_name=' + name + '&last_name=' + last + '&user_age=' + age
end
get '/haircolor' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  erb :haircolor, :locals => {:name => name, :last => last, :age => age}
end
post '/haircolor' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  hair = params[:hair_colour]
  redirect 'eyecolor?user_name='+ name + '&last_name=' + last + '&user_age=' + age + '&hair_colour=' + hair
end
get '/eyecolor' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  hair = params[:hair_colour]
  erb :eyecolor, :locals => {:name => name, :last => last, :age => age, :hair => hair}
 end
post '/eyecolor' do
  age = params[:user_age]
  name = params[:user_name]
  hair = params[:hair_colour]
  eyes = params[:eye_colour]
  last = params[:last_name]
  redirect  'favfood?user_name=' + name + '&last_name=' + last + '&user_age=' + age + '&hair_colour=' + hair + '&eye_colour=' + eyes
end
get '/favfood' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  hair = params[:hair_colour]
  eyes = params[:eye_colour]
  erb :fav_food, :locals => {:name => name, :last => last, :age => age, :hair => hair, :eyes => eyes}
end
post '/favfood' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  hair = params[:hair_colour]
  eyes = params[:eye_colour]
  food = params[:fav_food]
  redirect  'favdrink?user_name=' + name + '&last_name=' + last + '&user_age=' + age + '&hair_colour=' + hair + '&eye_colour=' + eyes + '&fav_food=' + food
end

get '/favdrink' do
  age = params[:user_age]
  name = params[:user_name]
  last = params[:last_name]
  hair = params[:hair_colour]
  eyes = params[:eye_colour]
  food = params[:fav_food]
  puts "user age is #{age}"
  erb :fav_drink, :locals => {:name => name, :last => last, :age => age, :hair => hair, :eyes => eyes, :food => food}
end
# get '/three_numbers' do
#   age = params[:age]
#   name = params[:user_name]
#   last = params[:last_name]
#   erb :three_numbers, :locals => {:name => name, :age => age, :last => last}
# end
# post '/three_numbers' do
#   age = params[:user_age]
#   name = params[:user_name]
#   last = params[:last_name]
#   num1 = params[:favenum1]
#   num2 = params[:favenum2]
#   num3 = params[:favenum3]
#   totalnumbers = sum(num1.to_i, num2.to_i, num3.to_i)
#   redirect 'total?user_name=' + name + '&last_name=' + last + '&user_age=' + age + '&favenum1=' + num1 + '&favenum2=' + num2 + '&favenum3=' + num3
# end
# get "/total" do
#   age = params[:user_age]
#   name = params[:user_name]
#   last = params[:last_name]
#   num1 = params[:favenum1]
#   num2 = params[:favenum2]
#   num3 = params[:favenum3]
#   totalnumbers = params[totalnumbers]
#   erb :total, :locals=>{:name=> name, :last_name => last, :age=>age, :favenum1=>num1, :favenum2=>num2, :favenum3=>num3, :totalnumbers=>totalnumbers}
# end
# post 'total' do
#   age = params[:user_age]
#   name = params[:user_name]
#   num1 = params[:favenum1]
#   num2 = params[:favenum2]
#   num3 = params[:favenum3]
# end
