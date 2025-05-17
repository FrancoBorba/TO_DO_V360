class ListsController < ApplicationController
  before_action :autenticar_usuario!
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  
def index
  @lists = usuario_logado.lists
end

  # GET /lists/1 or /lists/1.json

  def show
    @list  = List.find(params[:id])
    # Carrega todos os itens, ordenando:
    #  primeiro pelos nao concluidos (concluido: false vem antes de true)
    #   depois pela data de criacao 
    @items = @list.items.order(:concluido, :created_at)
  end



  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
      @list = usuario_logado.lists.build(list_params)
      
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "Lista criada com sucesso." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "Lista atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!

    respond_to do |format|
      format.html { redirect_to lists_path, status: :see_other, notice: "Lista removida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:nome)
    end
end
