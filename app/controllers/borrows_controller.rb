class BorrowsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_borrow, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:active_borrow, :destroy]
  before_action :current_borrow,   only: [:edit, :update] 
  # GET /borrows
  # GET /borrows.json
  def index
    current_user = Borrow.where(user_id: session[:user_id]).distinct.pluck(:user_id)
    @borrows = Borrow.joins(:indentify, :book).where(user_id: current_user,mode:0).select("indentifies.*,borrows.*,books.*,borrows.mode",).paginate(:per_page => 2, :page => params[:page])
  end
  def active_borrow
    @borrows = Borrow.joins(:indentify, :book,:user).where(mode:0).select("indentifies.*,borrows.*,books.*,borrows.mode,users.*,borrows.id",).paginate(:per_page => 12, :page => params[:page])
    
  end
  def sachchuatra
    current_user = Borrow.where(user_id: session[:user_id]).distinct.pluck(:user_id)
    @borrows = Borrow.joins(:indentify, :book,:user).where(mode:1,user_id: current_user).select("indentifies.*,borrows.*,books.*,borrows.mode,users.*,borrows.id",).paginate(:per_page => 2, :page => params[:page])
    
  end

  # GET /borrows/1
  # GET /borrows/1.json
  def show
    @borrows = Borrow.joins(:indentify, :book).where(user_id: current_user).select("borrows.*,indentifies.*,books.*,borrows.id",)

  end

  # GET /borrows/new
  def new
    @borrow = Borrow.new
  end

  # GET /borrows/1/edit
  def edit
  end

  # POST /borrows
  # POST /borrows.json
  def create
    @borrow = Borrow.new(borrow_params)

    respond_to do |format|
      if @borrow.save
        # format.html { redirect_to @borrow, notice: 'Borrow was successfully created.' }
        # format.json { render :show, status: :created, location: @borrow }
        format.js{}
      else
        # format.html { render :new }
        # format.json { render json: @borrow.errors, status: :unprocessable_entity }
        format.js{render json: @borrow.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /borrows/1
  # PATCH/PUT /borrows/1.json
  def update
    respond_to do |format|
      if @borrow.update(borrow_params)
        format.js{}
      
      else
        format.js{}
      end
    end
  end

  # DELETE /borrows/1
  # DELETE /borrows/1.json
  def destroy
    @borrow.destroy
    respond_to do |format|
      redirect_to chuatra_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow
      @borrow = Borrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_params
      params.require(:borrow).permit(:user_id, :soluongmuon, :indentify_id,:book_id, :mode, :mode1)
    end

    def check_admin
      if admin_user
        flash[:danger] = "Chỉ có admin mới có thể sử dụng chức năng này"
      end 
    end  
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end  
end
