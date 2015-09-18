class RailCarsController < ApplicationController
  before_action :authorize
  before_action :set_rail_car, only: [:show, :edit, :update, :destroy]

  # GET /rail_cars
  # GET /rail_cars.json


  def index
    @rail_cars = RailCar.all
  end

  # GET /rail_cars/1
  # GET /rail_cars/1.json

  def show
  end

  # GET /rail_cars/new
  def new
    @rail_car = RailCar.new
    @vendors = Vendor.list_for_select
  end

  # GET /rail_cars/1/edit
  def edit
    @vendors = Vendor.list_for_select
  end

  # POST /rail_cars
  # POST /rail_cars.json
  def create
    @rail_car = RailCar.new(rail_car_params)
    @vendors = Vendor.list_for_select

    respond_to do |format|
      if @rail_car.save
        format.html { redirect_to @rail_car, notice: 'Rail car was successfully created.' }
        format.json { render :show, status: :created, location: @rail_car }
      else
        format.html { render :new }
        format.json { render json: @rail_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rail_cars/1
  # PATCH/PUT /rail_cars/1.json

  def update
    @vendors = Vendor.list_for_select
    respond_to do |format|
      if @rail_car.update(rail_car_params)
        format.html { redirect_to @rail_car, notice: 'Rail car was successfully updated.' }
        format.json { render :show, status: :ok, location: @rail_car }
      else
        format.html { render :edit }
        format.json { render json: @rail_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rail_cars/1
  # DELETE /rail_cars/1.json
  def destroy
    @rail_car.destroy
    respond_to do |format|
      format.html { redirect_to rail_cars_url, notice: 'Rail car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def connect_railcar_vendor
    rail_car = RailCar.find(params[:id])
    vendor = Vendor.find(params[:vendor_id])
    rail_car.vendor = vendor
    rail_car.save
    redirect_to rail_car_path(rail_car)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rail_car
      @rail_car = RailCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rail_car_params
      params.require(:rail_car).permit(:railcar_nbr, :wgt_on_arrival, :wgt_at_origin, :sand_grade, :car_empty, :bol_nbr, :vendor_id, :vendor_po_nbr, :email_bol, :purchaseorder_id, :arrival_dt_elk_city, :arrival_dt_400_line, :actual_dep_dt, :arrival_dt_onsite, :bol_arrival_dt, :added_by, :changed_by)
    end
end
