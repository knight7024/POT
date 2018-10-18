class MainController < ApplicationController
  before_action :authenticate_user!
  @@const_type = nil
	
  def posts
	  @game = Game.all
	  @post_overwatch = PostOverwatch.all
  end
	
  def create_matching
	  @type = params[:type]
	  @game = Game.find(Integer(@type) + 1)
	  @@const_type = @type
  end
	
  def create
	  if @@const_type == '0'
		  article = PostOverwatch.new
		  article.game_id = Integer(@@const_type) + 1;
		  article.title = params[:title]
		  article.game_mode = params[:gamemode]
		  article.role = params[:role]
		  article.tier = params[:tier]
		  article.play_date = params[:playabletime]
		  article.use_mic = params[:use_mic]
		  article.battletag = params[:battletag]
		  article.comment = params[:comment]
		  article.all_member = params[:member]
		  article.user_id = current_user.id
		  article.ip_address = request.remote_ip
		  article.save
	  end
	  redirect_to pots_path
  end
	
  def get_game_posts
	  typeID = params[:type]
	  potID = params[:pot]
	  if typeID and potID == nil
	  	game = returnGame(typeID)
	  	render :json => game
	  elsif typeID and potID
		game = returnGame(typeID)
		pot = game.find(potID)
		render :json => pot
  	  end
  end
	
  def returnGame(typeID)
	  case typeID
		  when '0' 
		  	game = PostOverwatch.all
		  when '1'
		  	# game = PostOverwatch.all
		  when '2'
		  	# game = PostOverwatch.all
	  end
	return game  
  end
end
