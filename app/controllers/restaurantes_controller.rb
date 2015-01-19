class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:show, :edit, :update, :destroy]

  # GET /restaurantes
  # GET /restaurantes.json
  
 
  def index
   # @restaurantes = Restaurante.order :nome
   #@restaurantes = Restaurante.all
    #render "index"
   @restaurantes = Restaurante.all.paginate(:page => params[:page], :per_page => 5)

  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
   
  end

  # GET /restaurantes/new
  def new
    @restaurante = Restaurante.new
  end

  # GET /restaurantes/1/edit
  def edit
    #@restaurante = Restaurante.find(params[:id])
  end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)
    #@restaurante = Restaurante.new params.require(:restaurante).permit(:nome, :endereco,:especialidade)
    #@restaurante = Restaurante.new(params[:restaurante])

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: 'Restaurante criado com sucesso!.' }
        format.json { render :show, status: :created, location: @restaurante }
      else
        format.html { render :new }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1
  # PATCH/PUT /restaurantes/1.json
  def update
   # @restaurante = Restaurante.find params[:id]
    respond_to do |format|
      if @restaurante.update(restaurante_params)
        format.html { redirect_to @restaurante, notice: 'Restaurante editado  com sucesso!.' }
        format.json { render :show, status: :ok, location: @restaurante }
      else
        format.html { render :edit }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
   # @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    respond_to do |format|
      format.html { redirect_to restaurantes_url, notice: 'Restaurante deletado com sucesso!.' }
      format.json { head :no_content }
      
     # redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.friendly.find(params[:id])
    end
    
    def self.find_by_slug(slug)
      result = find(slug)
      if result.to_param == slug
        result
      else
        raise ActiveRecord::RecordNotFound
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurante_params
      params.require(:restaurante).permit(:nome, :endereco, :especialidade)
      #params[:restaurante]
    end
end
