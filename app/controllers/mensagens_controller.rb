class MensagensController < ApplicationController
  before_action :set_mensagem, only: [:show, :edit, :update, :destroy]
  before_filter  :authenticate_user!, except: [:create]

  # GET /mensagens
  # GET /mensagens.json
  def index
    @mensagens = Mensagem.all
  end

  # GET /mensagens/1
  # GET /mensagens/1.json
  def show
  end

  # GET /mensagens/new
  def new
    @mensagem = Mensagem.new
  end

  # GET /mensagens/1/edit
  def edit
  end

  # POST /mensagens
  # POST /mensagens.json
  def create
    @mensagem = Mensagem.new(mensagem_params)
    @mensagem.desaprovar

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to @mensagem.presente.lista, notice: 'Mensagem Adicionada. Após aprovação do proprietário da lista será exibida.' }
        format.json { render action: 'show', status: :created, location: @mensagem }
      else
        format.html { render action: 'new' }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagens/1
  # PATCH/PUT /mensagens/1.json
  def update
    respond_to do |format|
      if @mensagem.update(mensagem_params)
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1
  # DELETE /mensagens/1.json
  def destroy
    @mensagem.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def aprovar
    @mensagem = Mensagem.find(params[:mensagem_id])

    respond_to do |format|
      if @mensagem.update(aprovada: true)
        format.html { redirect_to @mensagem.presente.lista, notice: 'A mensagem agora está visível.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  def desaprovar
    @mensagem = Mensagem.find(params[:mensagem_id])

    respond_to do |format|
      if @mensagem.update(aprovada: false)
        format.html { redirect_to @mensagem.presente.lista, notice: 'A mensagem agora está oculta.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagem
      @mensagem = Mensagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagem_params
      params.require(:mensagem).permit(:remetente, :texto, :aprovada, :presente_id)
    end
end
