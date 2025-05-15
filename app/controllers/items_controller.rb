class ItemsController < ApplicationController
  before_action :set_list # Antes de executar qualquer coisa chama set list
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /lists/:list_id/items
  #Ex: /lists/3/items
  def index
  # Armazena os itens da list buscada em @itens que sera renderizado pelo rails
  # Usado para mostrar todos os itens na view index.html.erb
    @items = @list.items 
  end

  # GET /lists/:list_id/items/:id
  #Ex: /lists/3/items/7
  # Mostra os detalhes de um único item
  #O item ja foi carregado com set_item, entao nao precisa fazer mais nada aqui.
  def show
  end

  # GET /items/new
  def new
  # Cria uma nova instancia de item associada a list
    @item = @list.items.new
  end

  # GET /items/1/edit
  # Mostra o formulário para editar um item 
  #O item já foi carregado com set_item
  
  def edit
  end

  # POST /lists/:list_id/items
  def create
    @item = @list.items.new(item_params)

    respond_to do |format|
      if @item.save
      #ao ser criado um item eh chamado este turbo_stream (ir para a classe dele para ver sua funcao)
      format.turbo_stream { }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #PATCH /lists/:list_id/items/:id
  def update
    respond_to do |format|
    # Atualiza um item com os novos dados do formulario
      if @item.update(item_params)
       format.turbo_stream 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/:list_id/items/:id
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_list
  #Busca a lista que esta vindo do parametro da URL e armazena
  # Ex: /lists/3/items
  # Busca no metodo List.find a lista de parametro 3 e armazena em @List
    @list = List.find(params[:list_id])
  end
    
    def set_item
    # Busca um item dentro da lista ja carregada pelo seu id
      @item = @list.items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
    #Garante segurança no recebimento dos dados

    #So permite mudar os atributos(nome, concluido)
      params.require(:item).permit(:nome, :concluido)
    end
end
