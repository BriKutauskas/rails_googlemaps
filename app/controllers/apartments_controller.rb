class ApartmentsController < ApplicationController
  before_action :authenticate_user! #add this line
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource   # add this line
  # GET /apartments
  # GET /apartments.json
  def index
    authorize! :index, Apartment
    if params[:search].nil? || params[:search].empty?
      @apartments = Apartment.all
    else
      @apartments = Apartment.basic_search(params[:search])
      render '/apartments/index.html'
    end
  end

  def search

  end
  # GET /apartments/1
  # GET /apartments/1.json
  def show
    authorize! :show, @apartment
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
    authorize! :new, @apartment
    @user = current_user
  end

  # GET /apartments/1/edit
  def edit
    authorize! :edit, @apartment
    @user = current_user
  end

  # POST /apartments
  # POST /apartments.json
  def create
    authorize! :create, @apartment
    @apartment = Apartment.new(apartment_params)
    @user = current_user
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    authorize! :update, @apartment
    @user = current_user
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    authorize! :destroy, @apartment
    @apartment.destroy
    @user = current_user
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:street, :latitude, :longitude, :city, :zip, :state, :country, :name, :phone, :hours_contact, :image, :user_id)
    end
end
