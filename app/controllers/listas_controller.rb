class ListasController < ApplicationController
  before_action :set_lista, only: [:show, :edit, :update, :destroy]
  before_filter  :authenticate_user!, except: [:show, :busca]

  # GET /listas
  # GET /listas.json
  def index
    @listas = Lista.where(user_id: current_user.id)
  end

  # GET /listas/1
  # GET /listas/1.json
  def show
    @lista = Lista.find(params[:id])

    respond_to do |format|
      if @lista.publica?
        format.html { render 'show' }
      else
        if (user_signed_in? && current_user.id == @lista.user_id)
          format.html { render 'show' }
        else
          format.html { render home_index_path, notice: "Lista não encontrada." }
        end
      end
    end
  end

  # GET /listas/new
  def new
    @lista = Lista.new
  end

  # GET /listas/1/edit
  def edit
  end

  # POST /listas
  # POST /listas.json
  def create
    @lista = Lista.new(lista_params)

    respond_to do |format|
      if @lista.save
        format.html { redirect_to @lista, notice: 'Lista was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lista }
      else
        format.html { render action: 'new' }
        format.json { render json: @lista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listas/1
  # PATCH/PUT /listas/1.json
  def update
    respond_to do |format|
      if @lista.update(lista_params)
        format.html { redirect_to @lista, notice: 'Lista was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listas/1
  # DELETE /listas/1.json
  def destroy
    @lista.destroy
    respond_to do |format|
      format.html { redirect_to listas_url }
      format.json { head :no_content }
    end
  end

  # POST /listas
  # POST /listas.json
  def busca
    palavras = params[:pesquisar][:palavras_texto].split
    sql = ""
    palavras.each do |p|
      if (p.size > 2 && !%w(para com um uma por pela pelo for).include?(p))
        sql = sql + "upper(nome) LIKE '%#{p.upcase}%' OR upper(presenteados) LIKE '%#{p.upcase}%' OR "
      end
    end
    @listas = Lista.where(sql[0..-5]).order("dt_fechamento DESC", "created_at DESC")

    respond_to do |format|
      if (!@listas.empty?)
        format.html { render "busca" }
        format.json { render json: @listas }
      else
        format.html { redirect_to home_index_path, notice: "Nenhuma lista encontrada" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista
      @lista = Lista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lista_params
      params.require(:lista).permit(:nome, :presenteados, :descricao, :foto, :user_id, :publicada, :dt_fechamento)
    end
end
