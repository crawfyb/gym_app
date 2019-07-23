require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/gym_classes.rb' )
also_reload( '../models/*' )

# index
get '/classes' do
  @gym_classes = GymClass.all()
  erb ( :"gym_classes/index" )
end

# new
get '/classes/new' do
  @members = Member.all
  @gym_classes = GymClass.all
  erb(:"gym_classes/new")
end

# create
post '/classes' do
  @gym_classes = GymClass.new(params)
  @gym_classes.save()
  erb(:"gym_classes/create")
end

# show
get '/classes/:id' do
  @gym_classes = GymClass.find(params['id'].to_i)
  erb( :"gym_classes/show" )
end

# delete
post '/classes/:id/delete' do
  GymClass.destroy(params['id'].to_i)
  redirect('/classes')
end

#edit
get '/classes/:id/edit' do
  @gym_classes = GymClass.find(params[:id])
  erb(:"gym_classes/edit")
end

# update
post '/classes/:id' do
  Gym.new(params).update
  redirect('/members')

end
