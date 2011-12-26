require 'sinatra'

API_KEY_EVENTFUL = "psSPFxbbCzt73bHW"

class API < Sinatra::Base
  
  get "/" do
    results = {:status => "ok",
               :response_message => "Nothing at index",
               :data => []}
    content_type :json
    results.to_json

  end

  get "/recommendations/:id/:lat/:lng" do
    results = {
      :status => "ok",
      :response_message => "",
      :data => [
        {:name => "food", :items => []}, 
        {:name => "food", :items => []}, 
        {:name => "food", :items => []}
        ]
      }
      
    id = params[:id]
    lat = params[:lat]
    lng = params[:lng]
    
    content_type :json
    results.to_json
  end
  
  get "/hello" do
    return "{response:ok, data:'Hello'}"
  end
end
