class CatogariesController < ApplicationController
  before_action :set_catogary, only: [:show, :edit, :update, :destroy]

  # GET /catogaries
  # GET /catogaries.json
  def index
    @catogaries = Catogary.all
  end

  # GET /catogaries/1
  # GET /catogaries/1.json
  def show
  end

  # GET /catogaries/new
  def new
    @catogary = Catogary.new
    
  end

  # GET /catogaries/1/edit
  def edit
  end

  # POST /catogaries
  # POST /catogaries.json
  def create
    @catogary = Catogary.new(catogary_params)

    respond_to do |format|
      if @catogary.save
        format.html { redirect_to @catogary, notice: 'Catogary was successfully created.' }
        format.json { render :show, status: :created, location: @catogary }
      else
        format.html { render :new }
        format.json { render json: @catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catogaries/1
  # PATCH/PUT /catogaries/1.json
  def update
    respond_to do |format|
      if @catogary.update(catogary_params)
        format.html { redirect_to @catogary, notice: 'Catogary was successfully updated.' }
        format.json { render :show, status: :ok, location: @catogary }
      else
        format.html { render :edit }
        format.json { render json: @catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catogaries/1
  # DELETE /catogaries/1.json
  def destroy
    @catogary.destroy
    respond_to do |format|
      format.html { redirect_to catogaries_url, notice: 'Catogary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catogary
      @catogary = Catogary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catogary_params
      params.require(:catogary).permit(:tenloai)
    end
end
