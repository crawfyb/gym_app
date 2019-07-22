require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )

# index
get '/members' do
  @members = Member.all
  erb(:"members/index")
end

# show
get '/members/:id' do
  @members = Member.find(params['id'].to_i)
  erb(:"members/show")
end
