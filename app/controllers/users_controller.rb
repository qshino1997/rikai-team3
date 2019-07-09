class UsersController < AdminController
  before_action :logged_in_user, only: [:edit, :update, :show, :adminedit]
  before_action :correct_user,   only: [:edit, :update]
  # GET /users
  # GET /users.json
  
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/adminedit
  def adminedit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user
      else
        render 'new'
      end
    end
    # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Sửa thông tin thành công' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def quantri
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :email, :password ,:masv , :lop , :hoten , :sdt , :thuongtru , :namsinh_at )
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
end

class UsersController < AdminController