class PurchasersController < ApplicationController
  before_action :set_purchaser, only: [:show, :edit, :update, :destroy]

  # GET /purchasers
  # GET /purchasers.json
  def index
    @purchasers = Purchaser.all
  end

  # GET /purchasers/1
  # GET /purchasers/1.json
  def show
  end

  # GET /purchasers/new
  def new
    @purchaser = Purchaser.new
  end

  # GET /purchasers/1/edit
  def edit
  end

  # POST /purchasers
  # POST /purchasers.json
  def create
    @purchaser = Purchaser.new(purchaser_params)

    respond_to do |format|
      if @purchaser.save
        format.html { redirect_to @purchaser, notice: 'Purchaser was successfully created.' }
        format.json { render :show, status: :created, location: @purchaser }
      else
        format.html { render :new }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchasers/1
  # PATCH/PUT /purchasers/1.json
  def update
    respond_to do |format|
      if @purchaser.update(purchaser_params)
        format.html { redirect_to @purchaser, notice: 'Purchaser was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchaser }
      else
        format.html { render :edit }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchasers/1
  # DELETE /purchasers/1.json
  def destroy
    @purchaser.destroy
    respond_to do |format|
      format.html { redirect_to purchasers_url, notice: 'Purchaser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchaser
      @purchaser = Purchaser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchaser_params
      params.require(:purchaser).permit(:name, :count)
    end
end
