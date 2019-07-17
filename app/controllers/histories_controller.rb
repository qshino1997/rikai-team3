class HistoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.joins(:book,:indentify,:user).where(mode: 0).select("histories.*,books.*,histories.mode,indentifies.*,users.*,histories.id").paginate(:per_page => 2, :page => params[:page])
    @borrows = Borrow.all
  end
  def index_history
    @histories = History.joins(:book,:indentify,:user).where(mode: 1).select("histories.*,books.*,histories.mode,indentifies.*,users.*,histories.id").paginate(:per_page => 2, :page => params[:page])
  end
  def index_history_user
    @histories = History.joins(:book,:indentify,:user).where(mode: 1,user_id:session[:user_id]).select("histories.*,books.*,histories.mode,indentifies.*,users.*,histories.id").paginate(:per_page => 2, :page => params[:page])
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
       format.js{}
      else
        format.js{}
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.js{}
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.js{}
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:user_id, :indentify_id, :book_id, :mode)
    end
end