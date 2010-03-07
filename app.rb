# Note the application's root directory for convenience
ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)



# ===== HELPERS ===== #

helpers do
  
  def test
    'test'
  end
  
end


# ===== ROUTES ===== #

get '/' do
  haml :index
end