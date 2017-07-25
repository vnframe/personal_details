require "sinatra"

get "/" do
  erb :index
end
post "/name" do
  name = params[:user_name]
  redirect "/age?user_name=" + name
end
get "/age" do
  name = params[:user_name]
    erb :get_age, :locals => {:name => name}
  end
  get "/three_numbers" do
    name = params[:user_name]
    erb :three_numbers, :locals => {:name => name}
  end
