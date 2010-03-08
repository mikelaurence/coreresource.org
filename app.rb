# ===== HELPERS ===== #

helpers do
  
  def test
    'test'
  end
  
end


# ===== STYLESHEETS ===== #

get '/stylesheets/app.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :app
end


# ===== PAGES ===== #

map :root, '/'
map :quick_start, '/quick_start'
map :tutorials, '/tutorials'
map :documentation, '/documentation'
map :community, '/community'

get root_path do
  haml :index
end

get quick_start_path do
  haml :quick_start
end

get tutorials_path do
  haml :tutorials
end

get documentation_path do
  haml :documentation
end

get community_path do
  haml :community
end



# ===== WEB SERVICE ===== #

get '/pings.json' do
  PINGS.find().limit(20).sort([['id', :desc]]).to_a.to_json
end

post '/pings' do
  (PINGS.insert 'created_at' => DateTime.new, 'latitude' => params[:latitude], 'longitude' => params[:longitude], 
    'message' => params[:message], 'device' => params[:device]).to_json
end
