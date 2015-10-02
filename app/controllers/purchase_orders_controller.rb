class PurchaseOrdersController < ApplicationController

  before_action :authorize
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  # GET /purchase_orders.json
@vendors = Vendor.list_for_select
  def index
    @purchase_orders = PurchaseOrder.all.order(:po_nbr)
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.required_weight_tons = 0.00
    @new_po = true
    @vendors = Vendor.list_for_select
  end

  # GET /purchase_orders/1/edit
  def edit
    @vendors = Vendor.list_for_select
    @new_po = false
      # save the remaining weight tons  in case it got changed
    #@purchase_orders = PurchaseOrder.all
    #@prev_remaining_weight_tons = @purchase_order.remaining_weight_tons
    #puts "........................ remaining weight"
    #puts @prev_remaining_weight_tons.to_s
    #puts "end.............................."
  end


  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @vendors = Vendor.list_for_select
    @purchase_order.added_by = @user_full_name
    @purchase_order.changed_by = @user_full_name
    @purchase_order.remaining_weight_tons = @purchase_order.required_weight_tons
    #print"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz:"
    #puts @purchase_order.remaining_weight_tons
    #puts "xxxx"
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
    #@prev_remaining_weight_tons = @purchase_order.remaining_weight_tons
    @vendors = Vendor.list_for_select
    @purchase_order.changed_by = @user_full_name
    #puts "remaining weight tons assignemt.................................."
    #update_remaining_weight_tons
    #puts @purchase_order.remaining_weight_tons
    # recalculate just in case required_weight_tons changed
    #@purchase_order.remaining_weight_tons = @prev_remaining_weight_tons
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

  #def update_remaining_weight_tons
  #  @purchase_order.remaining_weight_tons = @purchase_order.required_weight_tons - @prev_remaining_weight_tons
  #end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:required_weight_tons,
                                              #:remaining_weight_tons,
                                              :vendor_id,
                                              :well_name,
                                              :sand_grade,
                                              :start_date,
                                              :active,
                                              :po_nbr)
    end
end
