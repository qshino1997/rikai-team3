class IndentifiesController < ApplicationController
  before_action :set_indentify, only: [:show, :edit, :update, :destroy]
  before_action :check_admin , only: [:edit, :destroy]
  before_action :correct_book,   only: [:edit, :update]
  # GET /indentifies
  # GET /indentifies.json
  def index
    @indentifies =Indentify.joins(:book).select("indentifies.*, books.*").paginate(page: params[:page])
    @books= Book.all
  end

  def index_user
     @indentifies =Indentify.joins(:book,:catogary).select("indentifies.*, books.*,indentifies.id,catogaries.tenloai").paginate(page: params[:page])
     @books = Book.all
  end


  # GET /indentifies/1
  # GET /indentifies/1.json
  def show
    @indentifies =Indentify.joins(:book).select("indentifies.*, books.*")
    @book = Book.find(params[:id])
    @identify = Indentify.find(params[:id])
  end

  # GET /indentifies/new
  def new
    @indentify = Indentify.new
    @books = Book.all
    @catogaries = Catogary.all
  end


  # GET /indentifies/1/edit
  def edit
    @indentifies =Indentify.joins(:book).select("indentifies.*, books.*")
    @books = Book.all
    @catogaries = Catogary.all



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
      params.require(:indentify).permit(:indentify_code, :book_id, :catogary_id, :picture)
    end

    def check_admin
      if admin_user
        flash[:danger] = "Chỉ có admin mới có thể sử dụng chức năng này"
      end 
    end  
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end  

    def correct_book
      @book = Book.find(params[:id])
      redirect_to(root_url) unless @book == current_book
    end
end
