class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      user_item = req.path.split("/items/").last
      if found_item = @@items.find {|item| item.name == user_item}
        resp.write found_item.price
        resp.status = 200
      else 
        resp.status = 400
        resp.write("Item not found")
      end
    else
      resp.status = 404
      resp.write("Route not found")
    end
    resp.finish
  end

end
# [Item.new("Figs",3.42),Item.new("Pears",0.99)])
#items have a name and a price