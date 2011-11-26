require 'sinatra/base'
require 'mustache/sinatra'

module GodSaveThePrint
  class App < Sinatra::Base
    register Mustache::Sinatra
    require "#{ROOT}/lib/views/layout"
    
    set :mustache, {
      :views     => "#{ROOT}/lib/views/",
      :templates => "#{ROOT}/lib/templates/"
    }
    
    get '/' do
      @title = "Mustache + Sinatra = Wonder"
      @items = items
      
      mustache :index
    end
    
    get "/:slug" do
      @title = "Mustache + Sinatra = Wonder"
      @item = item( params[:slug] )
      
      mustache :item
    end
    
    
    def items
      YAML.load( File.read( "#{ROOT}/db/items.yml" ) )["items"]
    end
    
    def item( slug )
      items.find { |e| e["slug"] == slug }
    end
  end
end