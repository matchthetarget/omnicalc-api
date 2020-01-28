Rails.application.routes.draw do

  get "/", controller: "application", action: "home"

  get("/flexible/square/:the_number", { :controller => "application", :action => "flex_square" })
  
  get("/flexible/square_root/:the_number", { :controller => "application", :action => "flex_square_root" })
  
  get("/flexible/random/:min/:max", { :controller => "application", :action => "flex_random" })
  
  get("/square/results", { :controller => "application", :action => "square" })
  
  get("/square_root/results", { :controller => "application", :action => "square_root" })
  
  get("/random/results", { :controller => "application", :action => "random" })
  
  get("/payment/results", { :controller => "application", :action => "payments" })

end
