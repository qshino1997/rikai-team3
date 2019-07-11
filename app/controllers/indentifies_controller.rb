class IndentifiesController < ApplicationController
  before_action :set_indentify, only: [:show, :edit, :update, :destroy]

  # GET /indentifies
  # GET /indentifies.json
  def index
    @indentifies =Indentify.joins(:book).select("indentifies.*, books.*")
  end

  # GET /indentifies/1
  # GET /indentifies/1.json
  def show
  end

  # GET /indentifies/new
  def new
    @indentify = Indentify.new
    @books = Book.all
  end

  # GET /indentifies/1/edit
  def edit
  end

  # POST /indentifies
  # POST /indentifies.json
  def create
    @indentify = Indentify.new(indentify_params)

    respond_to do |format|
      if @indentify.save
        format.html { redirect_to @indentify, notice: 'Indentify was successfully created.' }
        format.json { render :show, status: :created, location: @indentify }
      else
        format.html { render :new }
        format.json { render json: @indentify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indentifies/1
  # PATCH/PUT /indentifies/1.json
  def update
    respond_to do |format|
      if @indentify.update(indentify_params)
        format.html { redirect_to @indentify, notice: 'Indentify was successfully updated.' }
        format.json { render :show, status: :ok, location: @indentify }
      else
        format.html { render :edit }
        format.json { render json: @indentify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indentifies/1
  # DELETE /indentifies/1.json
  def destroy
    @indentify.destroy
    respond_to do |format|
      format.html { redirect_to indentifies_url, notice: 'Indentify was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indentify
      @indentify = Indentify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indentify_params
      params.require(:indentify).permit(:indentify_code, :book_id)
    end
end
