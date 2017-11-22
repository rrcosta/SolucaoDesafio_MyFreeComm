class ExampleInputsController < ApplicationController
  before_action :set_example_input, only: [:show, :edit, :update, :destroy]

  # GET /example_inputs
  # GET /example_inputs.json
  def index
    @example_inputs = ExampleInput.all

    respond_to do |format|
      format.html
      format.csv { send_data @example_inputs.to_csv(['purchaser name' , 'item description' , 'item price' , 'purchase count' , 'merchant address' , 'merchant name']) }
    end
  end

  def import
      if ExampleInput.formatoArquivo( params[:file] )
        ExampleInput.import( params[:file] )

        redirect_to revenues_path , notice: "Importação executada com sucesso! ;)"
      else
        redirect_to root_url , notice: "Arquivo inválido. Favor escolher um arquivo CSV"
      end
  end

  # GET /example_inputs/1
  # GET /example_inputs/1.json
  def show
  end

  # GET /example_inputs/new
  def new
    @example_input = ExampleInput.new
  end

  # GET /example_inputs/1/edit
  def edit
  end

  # POST /example_inputs
  # POST /example_inputs.json
  def create
    @example_input = ExampleInput.new(example_input_params)

    respond_to do |format|
      if @example_input.save
        format.html { redirect_to @example_input, notice: 'Example input was successfully created.' }
        format.json { render :show, status: :created, location: @example_input }
      else
        format.html { render :new }
        format.json { render json: @example_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example_inputs/1
  # PATCH/PUT /example_inputs/1.json
  def update
    respond_to do |format|
      if @example_input.update(example_input_params)
        format.html { redirect_to @example_input, notice: 'Example input was successfully updated.' }
        format.json { render :show, status: :ok, location: @example_input }
      else
        format.html { render :edit }
        format.json { render json: @example_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example_inputs/1
  # DELETE /example_inputs/1.json
  def destroy
    @example_input.destroy
    respond_to do |format|
      format.html { redirect_to example_inputs_url, notice: 'Example input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_input
      @example_input = ExampleInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_input_params
      params.require(:example_input).permit(:purchasername, :itemdescription, :itemprice, :purchasecount, :merchantaddress, :merchantname)
    end
end
