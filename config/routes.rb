Simplechat::Application.routes.draw do
  
  # Chat
  match "/chat/" => "chat#index"
  
  # Message
  match "/message/new/" => "message#new"
  match "/message/all/" => "message#all"
  
  # Users
  match "/user/new/" => "user#new"
  match "/user/authenticate/" => "user#authenticate"
  match "/user/logout/" => "user#logout" 
  match "/user/show/:name/" => "user#show"
  match "/user/me/" => "user#me"
  match "/register/" => "user#register"
  root :to => "user#join"

end
