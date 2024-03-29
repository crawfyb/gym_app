require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/gym_class_members.rb' )
require_relative( '../models/members.rb' )
require_relative( '../models/gym_classes.rb' )
also_reload( '../models/*' )

# index
get '/gym' do
  @gym = GymClassMember.all
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"gym/index")
end

# new
get '/gym/new' do
  @members = Member.all
  @gym_classes = GymClass.all
  @gym = GymClassMember.all
  erb(:"gym/new")
end

# show
get '/gym/:id' do
  @gym = GymClassMember.find(params['id'].to_i)
  erb(:"gym/show")
end


# create
post '/gym' do
  @gym = GymClassMember.new(params)
  @gym.save()
  erb(:"gym/create")
end
