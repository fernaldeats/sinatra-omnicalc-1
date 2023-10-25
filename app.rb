require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  "hello there"
erb(:hello)
end

get("/goodbye") do
erb(:bye)
end

get("/") do
  erb(:home)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  @the_square = @the_num ** 2
  erb(:square_results)
end

get("/square/new") do
  erb(:home)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num_root = params.fetch("user_number").to_f
  @the_square_root = @the_num_root ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f
  @the_r = @the_apr / 12 / 100
  @the_year = params.fetch("user_years").to_i
  @the_n = @the_year * 12
  @the_pv = params.fetch("user_pv").to_i
  @the_numerator = @the_r * @the_pv
  @the_denominator = 1 - (1 + @the_r) ** -@the_n
  @the_p = @the_numerator / @the_denominator
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f
  @the_max = params.fetch("user_max").to_f
  @the_random = rand(@the_min..@the_max)
  erb(:random_results)
end
