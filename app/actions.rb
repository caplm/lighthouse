# Homepage (Root path)
helpers do

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/profile' do
  erb :profile 
end

get '/movies/new' do
  erb :new_movie
end

post '/movies/new' do
  redirect '/movies/create'
end

get '/movies/new' do
end

post '/movies/create' do
  movie-title = params[:movie-title]
  year-released = params[:year-released]
  movie-director = params[:movie-director]
  movierating = params[:movierating]

  new_movie = current_user.movies.create movie-title: movie-title, year-released: year-released, movie-director: movie-director, movierating: movierating
  redirect "/movies/#{new_movie.id}"
end

get '/signup' do
  erb :signup
end


post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/signup' do
  post '/signup' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/profile' do
  redirect '/'
end