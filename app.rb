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
  File.join(ROOT, "views/case_studies/#{case_study}/#{file.to_s}.md")
end

def case_study_split(case_study, file)
  File.new(case_study_path(case_study, file)).read.split('==========')
end

def case_study_md(case_study, file, suffix = '')
  RDiscount.new(File.new(case_study_path(case_study, file)).read + suffix).to_html
end

def markdown(text)
  RDiscount.new(text).to_html
end



# ===== TOPICS ===== #

map :topics, '/topics'

get topics_path do
  cache 'topics' do
    @topics = TOPICS.find().sort('permalink')
    puts @topics
    haml :'topics/index'
  end
end

get '/topics/:topic' do
  @topic = TOPICS.find(:permalink => params[:topic])
  if @topic
    cache "topics/#{params[:topic]}" do
      haml :'topics/show'
    end
  else
    raise Sinatra::NotFound.new
  end
end

TOPIC_FILES = Dir.glob('views/topics/*.md')

TOPIC_FILES.each do |topic_file|
  permalink = topic_file.match(/([\-\w]+)\.md/)[1]
  TOPICS.update({ 'permalink' => permalink }, { 'permalink' => permalink, 'content' => File.new(topic_file).read }, :upsert => true)
end






# ===== HELPERS ===== #

def question(name)
end








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
