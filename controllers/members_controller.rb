require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )

# index
get '/members' do
  @members = Member.all
  erb(:"members/index")
end

# new
get '/members/new' do
  erb(:"members/new")
end

# show
get '/members/:id' do
  @members = Member.find(params['id'].to_i)
  erb(:"members/show")
end

# create
post '/members' do
  @members = Member.new(params)
  @members.save()
  erb(:"members/create")
end

post '/members/:id/delete' do
  Member.destroy(params['id'].to_i)
  # p Member.find(params['id'])
  redirect('/members')
end
