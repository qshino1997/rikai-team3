class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :logged_in_user, only: [:edit, :update, :show, :adminedit]
  before_action :correct_user,   only: [:edit, :update]
  before_action :check_admin, only: [:admin_edit, :destroy, :index, :create] 
  before_action :check_user, only: [:show, :edit]

  def index
    @users = if params[:timkiem]
    User.where('hoten LIKE ?', "%#{params[:timkiem]}%")
    else
    @users = User.all.paginate(:per_page => 2, :page => params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user
        flash[:success] = 'Đăng ký thành công'
      else
        render 'new'
      end
  end
  
  def update
      if @user.update(user_params)
        redirect_to current_user
        flash[:success] = 'Cập nhập thông tin thành công'
      else
        render 'edit'
        flash[:danger] = 'Cập nhập thông tin thất bại'
      end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_edit
  end   

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :password ,:masv , :lop , :hoten , :sdt , :thuongtru , :namsinh_at,:admin, :term )
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vui lòng đăng nhập để sử dụng chức năng này"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
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
  end

  