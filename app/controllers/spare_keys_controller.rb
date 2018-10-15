class SpareKeysController < ApplicationController
  before_action :set_spare_key, only: [:show, :edit, :update, :destroy]

  # GET /spare_keys
  # GET /spare_keys.json
  def index
    @spare_keys = SpareKey.all
  end

  # GET /spare_keys/1
  # GET /spare_keys/1.json
  def show
  end

  # GET /spare_keys/new
  def new
    @spare_key = SpareKey.new
  end

  # GET /spare_keys/1/edit
  def edit
  end

  # POST /spare_keys
  # POST /spare_keys.json
  def create
    @spare_key = SpareKey.new(spare_key_params)

    respond_to do |format|
      if @spare_key.save
        format.html { redirect_to @spare_key, notice: 'Spare key was successfully created.' }
        format.json { render :show, status: :created, location: @spare_key }
      else
        format.html { render :new }
        format.json { render json: @spare_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spare_keys/1
  # PATCH/PUT /spare_keys/1.json
  def update
    respond_to do |format|
      if @spare_key.update(spare_key_params)
        format.html { redirect_to @spare_key, notice: 'Spare key was successfully updated.' }
        format.json { render :show, status: :ok, location: @spare_key }
      else
        format.html { render :edit }
        format.json { render json: @spare_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spare_keys/1
  # DELETE /spare_keys/1.json
  def destroy
    @spare_key.destroy
    respond_to do |format|
      format.html { redirect_to spare_keys_url, notice: 'Spare key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare_key
      @spare_key = SpareKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spare_key_params
      params.require(:spare_key).permit(:barcode, :keycode)
    end
end
