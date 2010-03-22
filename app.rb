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
map :documentation, '/documentation'
map :community, '/community'

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



# ===== CASE STUDIES ===== #

map :case_studies, '/case-studies'

get case_studies_path do
  cache 'case-studies' do
    haml :'case_studies/index'
  end
end

get '/case-studies/:case_study' do
  @case_study = params[:case_study]
  if File.exist?("views/case_studies/#{@case_study}")
    cache "case-studies/#{@case_study}" do
      haml :'case_studies/show'
    end
  else
    raise Sinatra::NotFound.new
  end
end

CASE_STUDIES = Dir.glob('views/case_studies/*').select{ |fn| File.directory?(fn) }.collect{ |d| d.match(/\w+$/).to_s}

def case_study_has?(case_study, file)
  File.exist?(case_study_path(case_study, file))
end

def case_study_path(case_study, file)
  File.join(ROOT, "views/case_studies/#{case_study}/#{file.to_s.downcase}.md")
end

def case_study_read(case_study, file)
  File.read(case_study_path(case_study, file))
end

def case_study_split(case_study, file)
  File.read(case_study_path(case_study, file)).split('==========')
end




# ===== TOPICS ===== #

TOPIC_FILES = Dir.glob('views/topics/*.md')
TOPICS = TOPIC_FILES.collect{ |tf| tf.match(/([\-\w]+)\.md/)[1] }

map :topics, '/topics'

get topics_path do
  cache 'topics' do
    haml :'topics/index'
  end
end

# get '/topics/:topic' do
#   @topic = TOPICS.select{ |t| t == params[:topic] }
#   if @topic
#     cache "topics/#{@topic}" do
#       haml :'topics/show'
#     end
#   else
#     raise Sinatra::NotFound.new
#   end
# end



# ===== HELPERS ===== #

def markdown(text)
  RDiscount.new(text).to_html
end

def question(name)
end




# ===== WEB SERVICE ===== #

# get '/pings.json' do
#   cache 'pings.json' do
#     PINGS.find().limit(20).sort([['id', :desc]]).to_a.collect{ |p| p.merge({ 'id' => p.delete('_id').to_s }) }.to_json
#   end
# end
# 
# post '/pings' do
#   expire 'pings.json'
#   (PINGS.insert 'created_at' => Time.new, 'name' => params[:name], 'latitude' => params[:latitude], 'longitude' => params[:longitude], 
#     'message' => params[:message], 'device' => params[:device]).to_json
# end
