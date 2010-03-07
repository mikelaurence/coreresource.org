# ===== HELPERS ===== #

helpers do
  
  def test
    'test'
  end
  
end


# ===== ROUTES ===== #

map :root, '/'
map :quick_start, '/quick_start'
map :documentation, '/documentation'
map :community, '/community'

get root_path do
  haml :index
end

get quick_start_path do
  haml :quick_start
end

get documentation_path do
  haml :documentation
end