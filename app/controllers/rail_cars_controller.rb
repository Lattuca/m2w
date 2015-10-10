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

  # load POs with remaining weight lbs > 100 into arrays

  load_po_array

  def show
    # load the PO information to display po #
    if @rail_car.purchaseorder_id !=0
       @rail_car_po = PurchaseOrder.find(@rail_car.purchaseorder_id)
       @rail_car_po_nf = false
     else
       # set to 0 for the Show screen
       @rail_car_po_nf = true
     end
  end

  # GET /rail_cars/new
  def new
    #puts "44444444444444444444444 new load po array"
    load_po_array
    @cail_car_new = true
    @rail_car = RailCar.new
    @vendors = Vendor.list_for_select
  end

  # GET /rail_cars/1/edit
  def edit
    #@purchase_orders = PurchaseOrder.list_for_select_po
    if @rail_car.purchaseorder_id !=0
      @rail_car_new = false
    else
      @rail__new = true
    end
    load_po_array
    @vendors = Vendor.list_for_select
  end

  # POST /rail_cars
  # POST /rail_cars.json
  def create
    load_po_array # load POs for form selection
    @rail_car_new = true # used for form

    @rail_car = RailCar.new(rail_car_params)
    @vendors = Vendor.list_for_select
    @rail_car.added_by = @user_full_name
    @rail_car.changed_by = @user_full_name

    respond_to do |format|
      if @rail_car.save
        @rail_car.changed_by = @user_full_name
        format.html { redirect_to @rail_car, notice: 'Rail car was successfully created.' }
        format.json { render :show, status: :created, location: @rail_car }
      else
        format.html { render :new }
        format.json { render json: @rail_car.errors, status: :unprocessable_entity }
      end
      # update the PO remaing weight on the PO
      #puts"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb new trailer purchase id"
      #puts @trailer.purchaseorder_id.to_s
      update_po_remaining_tons(@rail_car.purchaseorder_id)
    end
  end

  # PATCH/PUT /rail_cars/1
  # PATCH/PUT /rail_cars/1.json

  def update
    @vendors = Vendor.list_for_select
    @rail_car.changed_by = @user_full_name
    respond_to do |format|
      if @rail_car.update(rail_car_params)
        format.html { redirect_to @rail_car, notice: 'Rail car was successfully updated.' }
        format.json { render :show, status: :ok, location: @rail_car }
      else
        format.html { render :edit }
        format.json { render json: @rail_car.errors, status: :unprocessable_entity }
      end
      # update the PO remaing weight on the PO
      #puts"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb update trailer purchase id"
      #puts @trailer.purchaseorder_id.to_s
      #update_po_remaining_tons(@rail_car.purchaseorder_id)
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


  def update_po_remaining_tons(po_id)
   return if po_id == 0 # exit if empty
    # function to update remaining weight tons

    #puts "****************************************in update po trailer purchase id"
    #puts po_id.to_s
    if @purchase_order = PurchaseOrder.find(po_id)
       @remaining_tons = @purchase_order.remaining_weight_tons - @rail_car.wgt_on_arrival
       if @remaining_tons >= 0
         @purchase_order.remaining_weight_tons = @remaining_tons
         @purchase_order.remaining_weight_lbs =  (@remaining_tons * 2206.7).to_i.round(-1)
         #puts ".........................................po.remaining weight"
         #puts   @purchase_order.remaining_weight_tons,@purchase_order.po_nbr.to_s,@purchase_order.id.to_s
         @purchase_order.save
         #puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx PO SAVED",po_id.to_s
       else
         puts "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
         puts "Remaining Weight cannot be less than 0"
         #@purchase_order.remaining_weight_tons = 0
       end

     else
       puts "........................................."
       puts "PO not found",po_id
       format.html { render :edit }
       format.json { render json: @trailer.errors, status: :unprocessable_entity }
     end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rail_car
      @rail_car = RailCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rail_car_params
      params.require(:rail_car).permit(:railcar_nbr, :wgt_on_arrival, :wgt_at_origin,
                  :sand_grade, :car_empty, :bol_nbr, :vendor_id, :vendor_po_nbr, :email_bol,
                  :purchaseorder_id, :arrival_dt_elk_city, :arrival_dt_400_line, :actual_dep_dt, :arrival_dt_onsite,
                  :bol_arrival_dt,
                  :doc, :doc_file_name, :doc_file_size, :doc_content_type, :doc_comment, :doc_updated_at)
    end
end
