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

  #def load_po_array
    #puts "ccccccccccccccccccccccccccccccccccccccccccccccccc PO Loading Array"
  #  @po_array = PurchaseOrder.where("remaining_weight_lbs > ?",100 ).map { |po_array| [po_array.po_nbr, po_array.id] }
  #end
  # GET /trailers/1
  # GET /trailers/1.json
  def show
    @date_component= Time.diff(@trailer.time_out, @trailer.time_in,'%y, %M, %w, %d and %h:%m:%s')
    @trailer.time_taken_number = @date_component[:diff].to_s

    # load the PO information to display po #
    if @trailer.purchaseorder_id !=0
       @trailer_po = PurchaseOrder.find(@trailer.purchaseorder_id)
       @trailer_po_nf = false
     else
       # set to 0 for the Show screen
       @trailer_po_nf = true
     end
  end


  # GET /trailers/new
  def new
    #puts "44444444444444444444444 new load po array"
    load_po_array
    @trailer_new = true
    @trailer = Trailer.new
  end


  # GET /trailers/1/edit
  def edit
    if @trailer.purchaseorder_id !=0
      @trailer_new = false
    else
      @trailer_new = true
    end
    load_po_array
    @date_component= Time.diff(@trailer.time_out, @trailer.time_in,'%y, %M, %w, %d and %h:%m:%s')
    @trailer.time_taken_number = @date_component[:diff].to_s
  end

  # POST /trailers
  # POST /trailers.json
  def create
    load_po_array
    @trailer_new = true
    @trailer = Trailer.new(trailer_params)
    #@purchase_orders = PurchaseOrder.list_for_select_po
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
      # update the PO remaing weight on the PO
      #puts"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb new trailer purchase id"
      #puts @trailer.purchaseorder_id.to_s
      update_po_remaining_tons(@trailer.purchaseorder_id)
    end
  end

  # PATCH/PUT /trailers/1
  # PATCH/PUT /trailers/1.json
  def update
    @trailer.changed_by = @user_full_name
    # update purchase order remaining weight  less what is the weight on the trailer (tons)
    load_po_array



    respond_to do |format|
      # Calculate duration
      @date_component= Time.diff(@trailer.time_out, @trailer.time_in,'%y, %M, %w, %d and %h:%m:%s')
      @trailer.time_taken_number = @date_component[:diff].to_s
      if @trailer.update(trailer_params)
        format.html { redirect_to @trailer, notice: 'Trailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer }
      else
        format.html { render :edit }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
      # update the PO remaing weight on the PO
      #puts"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb update trailer purchase id"
      #puts @trailer.purchaseorder_id.to_s
      update_po_remaining_tons(@trailer.purchaseorder_id)
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

  #def connect_po
  #  fail
  #  trailer = Trailer.find(params[:id])
  #  purchase_order = PurchaseOrder.find(params[:id])
  #  trailer.purchaseorder_id = purchase_order
  #  trailer.save
  #  redirect_to trailer_path(trailer)
  #end

  def update_po_remaining_tons(po_id)
   return if po_id == 0 # exit if empty
    # function to update remaining weight tons

    #puts "****************************************in update po trailer purchase id"
    #puts po_id.to_s
    if @purchase_order = PurchaseOrder.find(po_id)
       @remaining_tons = @purchase_order.remaining_weight_tons - @trailer.weight_tons
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
       #puts "........................................."
       #puts "record not found"
       format.html { render :edit }
       format.json { render json: @trailer.errors, status: :unprocessable_entity }
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = Trailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trailer_params
      params.require(:trailer).permit(:trailer_nbr, :driver_name, :carrier_id,
                                      :date_shipped, :bol_nbr, :time_in, :time_out,
                                      :time_taken_number, :railcar_nbr, :worker,
                                      :weight_lbs, :weight_tons, :purchaseorder_id,
                                      :doc, :doc_file_name, :doc_file_size,
                                      :doc_content_type, :doc_comment, :doc_updated_at
                                      )
    end
end
