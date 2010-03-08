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
map :tutorials, '/tutorials'
map :quick_start, '/quick_start'
map :documentation, '/documentation'
map :community, '/community'

get root_path do
  haml :index
end

get tutorials_path do
  haml :tutorials
end

get quick_start_path do
  haml :quick_start
end

get documentation_path do
  haml :documentation
end


# ===== WEB SERVICE ===== #

