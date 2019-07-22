require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class_members.rb' )
require_relative( '../models/members.rb' )
require_relative( '../models/gym_class.rb' )
also_reload( '../models/*' )

get '/gym' do
  @gym = GymClassMember.all
  erb(:)
end
