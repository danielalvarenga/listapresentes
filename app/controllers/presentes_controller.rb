class PresentesController < ApplicationController
  before_action :set_presente, only: [:show, :edit, :update, :destroy]
  before_filter  :authenticate_user!

  # GET /presentes
  # GET /presentes.json
  def index
    @presentes = Presente.all
  end

  # GET /presentes/1
  # GET /presentes/1.json
  def show
  end

  # GET /presentes/new
  def new
    @presente = Presente.new
  end

  # GET /presentes/1/edit
  def edit
  end

  # POST /presentes
  # POST /presentes.json
  def create
    @presente = Presente.new(presente_params)

    respond_to do |format|
      if @presente.save
        format.html { redirect_to presentes_url, notice: 'Presente was successfully created.' }
        format.json { render action: 'show', status: :created, location: @presente }
      else
        format.html { render action: 'new' }
        format.json { render json: @presente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentes/1
  # PATCH/PUT /presentes/1.json
  def update
    respond_to do |format|
      if @presente.update(presente_params)
        format.html { redirect_to @presente, notice: 'Presente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @presente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentes/1
  # DELETE /presentes/1.json
  def destroy
    @presente.destroy
    respond_to do |format|
      format.html { redirect_to presentes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presente
      @presente = Presente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presente_params
      params.require(:presente).permit(:nome, :valor, :foto, :url, :lista_id)
    end
end
