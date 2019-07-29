class IndentifiesController < ApplicationController
  before_action :set_indentify, only: [:show, :edit,:show_catogary, :update, :destroy]
  before_action :check_admin, only: [:index, :edit, :update, :create, :destroy, :new]
  before_action :check_user, only: [:index_user] 
  before_action :logged_in_user, only: [:index_user, :update, :show, :edit, :destroy, :index]
  
  # GET /indentifies
  # GET /indentifies.json
  def index
    @borrows = Borrow.joins(:indentify, :book).where(user_id: current_user,mode:0).select("indentifies.*,borrows.*,books.*,borrows.mode,borrows.mode1",).paginate(:per_page => 2, :page => params[:page])
    @indentifies = if params[:timkiem]
      @indentifies =Indentify.joins(:book).where('tieude LIKE ?', "%#{params[:timkiem]}%").select("indentifies.*, books.*,indentifies.id, books.tieude").paginate(:per_page => 12, :page => params[:page])
    else
      @indentifies =Indentify.joins(:book).select("indentifies.*, books.*,indentifies.id").paginate(:per_page => 12, :page => params[:page])
    end
  end

  def index_user
     @indentifies =Indentify.joins(:book,:catogary).select("indentifies.*, books.*,indentifies.id,catogaries.tenloai").paginate(:per_page => 12, :page => params[:page])
    @catogaries = Catogary.all
    @borrows = Borrow.joins(:indentify).select("indentifies.*,borrows.*,indentifies.id, borrows.indentify_id, borrows.mode1")
  end

  def show_catogary
     @indentify_catogaries =Indentify.joins(:book,:catogary).where(catogary_id:  3 ).select("indentifies.*, books.*,indentifies.id,catogaries.tenloai").paginate(:per_page => 2, :page => params[:page])
     
    end

    
    
    # GET /indentifies/1
    # GET /indentifies/1.json
  def show
    @indentifies =Indentify.joins(:book,:catogary).select("indentifies.*,books.id, books.*,indentifies.id,catogaries.tenloai")

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
        format.html { redirect_to thongtinsach_path, notice: 'Indentify was successfully updated.' }
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
    def set_catogary
      @catogary_id = Indentify.find(params[:catogary_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def indentify_params
      params.require(:indentify).permit(:indentify_code, :book_id, :catogary_id, :term)
    end 

    def check_admin
      if admin_user
        flash[:danger] = "Chỉ có admin mới có thể sử dụng chức năng này"
      end 
    end  
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end  

    def check_user
      if user
        flash[:danger] = "Chỉ có người dùng mới có thể sử dụng chức năng này, vui lòng dăng nhập tài khoản người dùng"
      end
    end

    def user
      redirect_to(root_url) if current_user.admin?
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vui lòng đăng nhập để sử dụng chức năng này"
        redirect_to login_url
      end
    end
end
