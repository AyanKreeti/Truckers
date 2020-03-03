require 'open3'
class Delivery < ApplicationRecord
  def self.order_tsp(orders = [])
    h=Hash.new
    orders.each do |o|
      h[o.id] = Array[o.lat, o.lng]
    end
  
    locs = h.values
    hm = Hash.new
    i=0
    h.keys.each do |k|
      hm[i]=k
      i=i+1
    end

    rows, cols = orders.size(),orders.size()  # your values
    grid = Array.new(rows) { Array.new(cols) }
    for i in 0..orders.size()-1 do
      for j in 0..orders.size()-1 do
        grid[i][j] = Geocoder::Calculations.distance_between([locs[i].first,locs[i].last],[locs[j].first,locs[j].last]).to_i
      end
    end

    # binding.pry
    lst=grid.to_s
    # binding.pry
    lst=lst.gsub(' ','')

    # system('chmod +x tsp_helper.sh')
    # system('bash tsp_helper.sh lst')
    # system('ls')
    lstr= "bash"+" tsp_helper.sh #{lst}"
    # system(lstr)
    
    details = Open3.capture3(lstr)
    # binding.pry
    route_details = details[1].split("\nINFO")[4].split(": ")[1]
    route_all = route_details.split("\n")[0]
    final_route = route_all.split("->")

    # final_route.each do |r|
    #   puts r
    # end
    
    order_list=Array.new
    # final_route.each do |ff|
    for ff in 0..final_route.size-2 do
      order_list.append(orders.find(hm[final_route[ff].to_i]))
    end
    
    # order_list.delete(order_list.last)
    return order_list
  end
end
