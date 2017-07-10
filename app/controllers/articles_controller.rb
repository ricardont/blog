
class ArticlesController < ApplicationController
	before_action  :authenticate_user!, except: [:index, :show]  
	before_action  :set_article, except: [:create, :new, :index]
	# get /articles/
	def index
		@articles = Article.all	
				@art_geojson = Array.new
		@articles.each do | art |
			@art_geojson << {
				 type: 'Feature',
				 geometry: {
					type: 'Point',
					coordinates: [art.longitude, art.latitude]

				 },
				 properties: {
				    id: art.id,
				    img: art.images.first.dir_url(:mini) ,
					price: art.price,
				 	location: art.location,
				 	popupContent: "This is where the Rockies play!"
    				
				 }
			}	
		end	
		respond_to do | format |
			format.html
			format.json { render json: @art_geojson} 
		end	
		
		
		
	end	
	# get /articles/:id	
	def show		
		@article.update_visits
		@image = Image.new
	end
	# GET /articles/new
	def new
		@article = Article.new	
	end
    def edit
    	
    end
	#post /articles/create
	def create
		@article = current_user.articles.new(article_params)
		if @article.save
			if params[:images]
			   params[:images].each { |image|
			   		@article.images.create(dir: image)
			   }
		     end
      		 flash[:notice] = "Your Article has been created."
      		 redirect_to @article
         else 
             flash[:alert] = "Something went wrong."
      		 render :new
  		end
	end	
	def destroy
		@article.destroy

		redirect_to  articles_path
	end
	def update	
		if  @article.update(article_params)
			if params[:images]
			   params[:images].each { |image|
	
					@article.images.create(dir: image)
				}
			end
			flash[:notice] = "Your Article has been created."
			redirect_to @article
		else
			flash[:alert]  = "Something went wrong"
			render :edit
		end
    end

    private
	def set_article
		@article = Article.find(params[:id])
	end
	def article_params
		# params.require(:article).permit(:price,:location, images_attributes: [:id, :image])
		params.require(:article).permit(:price, :location, :sq_mts_t, :sq_mts_c, :baths, :parks, :lvls, :desc, :latitude, :longitude)
	end	
end