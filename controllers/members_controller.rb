require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )


get '/members' do
  @members = Member.all
  erb(:"members/index")
end
