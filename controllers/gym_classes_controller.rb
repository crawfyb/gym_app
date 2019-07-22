require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/gym_classes.rb' )
also_reload( '../models/*' )

# index
get '/classes' do
  @gym_class = GymClass.all()
  erb ( :"gym_classes/index" )
end

# show
get '/classes/:id' do
  @gym_class = GymClass.find(params['id'].to_i)
  erb( :"gym_classes/show" )
end

# create
post '/classes' do
  @gym_class = GymClass.new(params)
  @gym_class.save()
  erb(:"gym_classes/create")
end

#edit
get '/pizza-classes/:id/edit' do
  @gym_class = GymClass.find(params[:id])
  erb(:"gymclasses/edit")
end
