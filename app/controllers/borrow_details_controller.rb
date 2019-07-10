class BorrowDetailsController < ApplicationController
  before_action :set_borrow_detail, only: [:show, :edit, :update, :destroy]

  # GET /borrow_details
  # GET /borrow_details.json
  def index
    @borrow_details = BorrowDetail.all
  end

  # GET /borrow_details/1
  # GET /borrow_details/1.json
  def show
  end

  # GET /borrow_details/new
  def new
    @borrow_detail = BorrowDetail.new
  end

  # GET /borrow_details/1/edit
  def edit
  end

  # POST /borrow_details
  # POST /borrow_details.json
  def create
    @borrow_detail = BorrowDetail.new(borrow_detail_params)

    respond_to do |format|
      if @borrow_detail.save
        format.html { redirect_to @borrow_detail, notice: 'Borrow detail was successfully created.' }
        format.json { render :show, status: :created, location: @borrow_detail }
      else
        format.html { render :new }
        format.json { render json: @borrow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_details/1
  # PATCH/PUT /borrow_details/1.json
  def update
    respond_to do |format|
      if @borrow_detail.update(borrow_detail_params)
        format.html { redirect_to @borrow_detail, notice: 'Borrow detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrow_detail }
      else
        format.html { render :edit }
        format.json { render json: @borrow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_details/1
  # DELETE /borrow_details/1.json
  def destroy
    @borrow_detail.destroy
    respond_to do |format|
      format.html { redirect_to borrow_details_url, notice: 'Borrow detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow_detail
      @borrow_detail = BorrowDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_detail_params
      params.require(:borrow_detail).permit(:borrow_id, :thoigianmuon, :thoigiantra)
    end
end
