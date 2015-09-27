class TrailersController < ApplicationController
  before_action :authorize
  before_action :set_trailer, only: [:show, :edit, :update, :destroy]

  #@purchaseorders = PurchaseOrder.list_for_select_po


  # GET /trailers
  # GET /trailers.json
  @purchase_orders = PurchaseOrder.list_for_select_po
  def index
    @trailers = Trailer.all
  end

  # GET /trailers/1
  # GET /trailers/1.json
  def show
  end
  # GET /trailers/new
  def new
    @trailer = Trailer.new
    @purchase_orders = PurchaseOrder.list_for_select_po

  end

  # GET /trailers/1/edit
  def edit
    @purchase_orders = PurchaseOrder.list_for_select_po
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
    @purchaseorders = PurchaseOrder.list_for_select_po
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
