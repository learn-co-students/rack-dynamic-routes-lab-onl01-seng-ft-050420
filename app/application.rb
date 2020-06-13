class Application

    def call(env)
        request = Rack::Request.new(env)
        response = Rack::Response.new
        
        if request.path.match(/items/)
            item_name = request.path.split("/items/").last
           if item = Item.item.find{|item| item.name == item_name} 
                item.name == item_name 
                response.write item.price
            else
                response.write "Item not found"
                response.status = 400
            end
        else 
            response.write "Route not found"
            response.status = 404
        end
        response.finish
    end


end