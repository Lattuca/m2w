class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @vendors = Vendor.list_for_select
  end

  # GET /purchase_orders/1/edit
  def edit
    @vendors = Vendor.list_for_select
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @vendors = Vendor.list_for_select

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def connect
    purchase_order = PurchaseOrder.find(params[:id])
    vendor = Vendor.find(params[:vendor_id])
    purchase_order.vendor = vendor
    purchase_order.save
    redirect_to purchase_order_path(purchase_order)
  end

  #def select
  #  @purchase_order_id = params[:id]
  #  @vendors = Vendor.find(pramas[:id])
  #end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:required_weight_tons, :required_weight_lbs, :remaining_weight_tons, :remaining_weight_lbs, :vendor_id, :well_name, :sand_grade, :start_date, :active, :added_by, :changed_by)
    end
end
