class PiDataController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]
  before_action :set_pi_datum, only: %i[ show edit update destroy ]

  # GET /pi_data or /pi_data.json
  def index
    @pi_data = PiDatum.all
  end

  # GET /pi_data/latest or /pi_data/latest.json
  def latest
    @pi_data = PiDatum.all[-([ PiDatum.all.length(), 100 ].min())...]
  end

  # GET /pi_data/1 or /pi_data/1.json
  def show
  end

  # GET /pi_data/new
  def new
    @pi_datum = PiDatum.new
  end

  # GET /pi_data/1/edit
  def edit
  end

  # POST /pi_data or /pi_data.json
  def create
    @pi_datum = PiDatum.new(pi_datum_params)

    respond_to do |format|
      if @pi_datum.save
        format.html { redirect_to @pi_datum, notice: "Pi datum was successfully created." }
        format.json { render :show, status: :created, location: @pi_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pi_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pi_data/1 or /pi_data/1.json
  def update
    respond_to do |format|
      if @pi_datum.update(pi_datum_params)
        format.html { redirect_to @pi_datum, notice: "Pi datum was successfully updated." }
        format.json { render :show, status: :ok, location: @pi_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pi_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pi_data/1 or /pi_data/1.json
  def destroy
    @pi_datum.destroy!

    respond_to do |format|
      format.html { redirect_to pi_data_path, status: :see_other, notice: "Pi datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pi_datum
      @pi_datum = PiDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pi_datum_params
      params.require(:pi_datum).permit(:color, :temperature, :pressure)
    end
end
