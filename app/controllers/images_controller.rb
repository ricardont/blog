class ImagesController < ApplicationController
  before_action :set_image, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_article
  before_action  :authenticate_user!, except: [:index, :show]  
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new

  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.save
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.article, notice: 'Imagen Cargada' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image.article, notice: 'Imagen Cargada' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
   respond_to do |format|
      format.html { redirect_to edit_article_path(@image.article),  notice: 'Imagen Eliminada' }
      format.json { head :no_content }
    end
  end

  private
    def  set_article
      #@article = Article.find(params[:article_id])
       @article = @image.article
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through. @article = @image.article
    def image_params
      params.require(:image).permit(:article_id, :dir, :height, :width)
    end
end
