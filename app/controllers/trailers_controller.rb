class TrailersController < ApplicationController
  before_action :authorize
  before_action :set_trailer, only: [:show, :edit, :update, :destroy]

  #@purchaseorders = PurchaseOrder.list_for_select_po


  # GET /trailers
  # GET /trailers.json
  #@purchase_orders = PurchaseOrder.list_for_select_po
  def index
    @trailers = Trailer.all
  end

  # GET /trailers/1
  # GET /trailers/1.json
  def show
    # load the PO information to display po #
    @trailer_po = PurchaseOrder.find(@trailer.purchaseorder_id)
  end
  # GET /trailers/new
  def new
    @trailer = Trailer.new
    @purchase_orders = PurchaseOrder.list_for_select_po

  end

  def load_po_array
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxPO Loading Array"
    @po_array = PurchaseOrder.where("remaining_weight_tons > ?",100 ).map { |po_array| [po_array.po_nbr, po_array.id] }

  end
  # GET /trailers/1/edit
  def edit
    @purchase_orders = PurchaseOrder.list_for_select_po
    load_po_array
  end

  # POST /trailers
  # POST /trailers.json
  def create
    @trailer = Trailer.new(trailer_params)
    @purchase_orders = PurchaseOrder.list_for_select_po
    @trailer.added_by = @user_full_name
    @trailer.changed_by = @user_full_name
    respond_to do |format|
      if @trailer.save
        format.html { redirect_to @trailer, notice: 'Trailer was successfully created.' }
        format.json { render :show, status: :created, location: @trailer }
      else
        format.html { render :new }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailers/1
  # PATCH/PUT /trailers/1.json
  def update
    @trailer.changed_by = @user_full_name
    @purchase_orders = PurchaseOrder.list_for_select_po

    # update purchase order remaining weight  less what is the weight on the trailer (tons)
    if @purchase_order = PurchaseOrder.find(@trailer.purchaseorder_id)
       @remaining_tons = @purchase_order.required_weight_tons - @trailer.weight_tons
       if @remaining_tons >= 0
         @purchase_order.remaining_weight_tons = @remaining_tons
         puts "........................................."
         puts   @purchase_order.remaining_weight_tons
       else
         puts "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
         puts "Remaining Weight cannot be less than 0"
         @purchase_order.remaining_weight_tons = 0
       end
       @purchase_order.save
     else
       puts "........................................."
       puts "record not found"
       format.html { render :edit }
       format.json { render json: @trailer.errors, status: :unprocessable_entity }
     end

    respond_to do |format|
      if @trailer.update(trailer_params)
        format.html { redirect_to @trailer, notice: 'Trailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer }
      else
        format.html { render :edit }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1
  # DELETE /trailers/1.json
  def destroy
    @trailer.destroy
    respond_to do |format|
      format.html { redirect_to trailers_url, notice: 'Trailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def connect_po
    fail
    trailer = Trailer.find(params[:id])
    purchase_order = PurchaseOrder.find(params[:id])
    trailer.purchaseorder_id = purchase_order
    trailer.save
    redirect_to trailer_path(trailer)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = Trailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trailer_params
      params.require(:trailer).permit(:trailer_nbr, :driver_name, :carrier_name,
                                      :date_shipped, :bol_nbr, :time_in, :time_out,
                                      :time_taken_number, :railcar_nbr, :worker,
                                      :weight_lbs, :weight_tons, :purchaseorder_id,
                                      :doc, :doc_file_name, :doc_file_size,
                                      :doc_content_type, :doc_comment, :doc_updated_at
                                      )
    end
end
