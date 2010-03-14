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
map :quick_start, '/quick-start'
map :case_studies, '/case-studies'
map :documentation, '/documentation'
map :community, '/community'
map :feed, '/feed'

get root_path do
  cache 'root' do
    haml :index
  end
end

get '/quick_start' do
  redirect '/quick-start'
end

get quick_start_path do
  cache 'quick-start' do
    haml :quick_start
  end
end

get case_studies_path do
  cache 'case-studies' do
    haml :'case_studies/index'
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

#get feed_path do
  #cache 'community' do
#    markdown :community
  #end
#end


# ===== ÇASE STUDIES ===== #

CASE_STUDIES = Dir.glob('views/case_studies/*').select{ |fn| File.directory?(fn) }.collect{ |d| d.match(/\w+$/).to_s}





# ===== WEB SERVICE ===== #

get '/pings.json' do
  cache 'pings.json' do
    PINGS.find().limit(20).sort([['id', :desc]]).to_a.collect{ |p| p.merge({ 'id' => p.delete('_id').to_s }) }.to_json
  end
end

post '/pings' do
  expire 'pings.json'
  (PINGS.insert 'created_at' => Time.new, 'name' => params[:name], 'latitude' => params[:latitude], 'longitude' => params[:longitude], 
    'message' => params[:message], 'device' => params[:device]).to_json
end
