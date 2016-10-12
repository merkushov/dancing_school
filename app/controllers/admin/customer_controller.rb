class Admin::CustomerController < Admin::BaseController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customer
  # GET /customer.json
  def index
    @customers = Customer.all
  end

  # GET /customer/1
  # GET /customer/1.json
  def show
  end

  # GET /customer/new
  def new
    @customer = Customer.new
  end

  # GET /customer/1/edit
  def edit
  end

  # POST /customer
  # POST /customer.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        # format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        flash[:success] = 'Customer was successfully created';
        format.html { redirect_to @customer }
        format.json { render :show, status: :created, location: @customer }
      else
        flash[:danger] = 'There was a problem creating the Customer.';
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/1
  # PATCH/PUT /customer/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        # format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        flash[:success] = 'Customer was successfully updated.';
        format.html { redirect_to @customer }
        format.json { render :show, status: :ok, location: @customer }
      else
        flash[:danger] = 'There was a problem updating the Customer.'
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/1
  # DELETE /customer/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      # format.html { redirect_to customer_url, notice: 'Customer was successfully destroyed.' }
      flash[:success] = 'Customer was successfully destroyed.';
      format.html { redirect_to customer_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:title, :notes)
    end
end
