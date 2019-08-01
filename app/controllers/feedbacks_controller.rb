class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:index]
  before_action :check_user, only: [:new] 
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = if params[:timkiem]
    @feedbacks = Feedback.joins(:user).where('hoten LIKE ?', "%#{params[:timkiem]}%").select("feedbacks.*,users.*")
    else

    @feedbacks = Feedback.joins(:user).select("feedbacks.*,users.*")
    
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @users = User.where(id: session[:user_id])

  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to sach_path }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:user_id, :email, :content, :term)
    end

    def check_admin
      if admin_user
        flash[:danger] = "Chỉ có admin mới có thể sử dụng chức năng này"
      end 
    end  
    
    def check_user
      if user
        flash[:danger] = "Chỉ có người dùng mới có thể sử dụng chức năng này, vui lòng dăng nhập tài khoản người dùng"
      end
    end

    def user
      redirect_to(root_url) if current_user.admin?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end 
end
