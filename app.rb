# ===== HELPERS ===== #

helpers do
  
  def test
    'test'
  end
  
end


# ===== STYLESHEETS ===== #

get '/stylesheets/app.css' do
  content_type 'text/css', :charset => 'utf-8'
  cache 'app.css' do
    less :app
  end
end


# ===== PAGES ===== #

map :root, '/'
map :quick_start, '/quick_start'
map :tutorials, '/tutorials'
map :documentation, '/documentation'
map :community, '/community'

get root_path do
  cache 'root' do
    haml :index
  end
end

get quick_start_path do
  cache 'quick_start' do
    haml :quick_start
  end
end

get tutorials_path do
  cache 'tutorials' do
    haml :tutorials
  end
end

get documentation_path do
  cache 'documentation' do
    haml :documentation
  end
end

get community_path do
  cache 'community' do
    haml :community
  end
end



# ===== WEB SERVICE ===== #

get '/pings.json' do
  cache 'pings.json' do
    PINGS.find().limit(20).sort([['id', :desc]]).to_a.collect{ |p| p.merge({ 'resourceId' => p.delete('_id').to_s }) }.to_json
  end
end

post '/pings' do
  expire 'pings.json'
  (PINGS.insert 'created_at' => DateTime.new, 'name' => params[:name], 'latitude' => params[:latitude], 'longitude' => params[:longitude], 
    'message' => params[:message], 'device' => params[:device]).to_json
end
