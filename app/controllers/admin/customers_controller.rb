class Admin::CustomersController < Admin::BaseController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customer
  # GET /customer.json
  def index
    @customers = Customer.all.order( created_at: "desc" )
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
        flash[:success] = 'Новый Ученик успешно создан'
        format.html { redirect_to admin_customers_path }
        format.json { render :show, status: :created, location: @customer }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Ученика';
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
        flash[:success] = 'Данные Ученика успешно обновлены';
        format.html { redirect_to [:admin, @customer] }
        format.json { render :show, status: :ok, location: @customer }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Ученика'
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/1
  # DELETE /customer/1.json
  def destroy
    respond_to do |format|
      flash[:danger] = "Удаление Учеников не предусмотрено"
      format.html { redirect_to admin_customers_path }
      format.json { head :no_content }
    end
  end

  # GET /customers/search
  def search
    like_string = "%#{params[:query]}%"
    @customers = Customer.where(
      "first_name LIKE ? OR last_name LIKE ? OR middle_name LIKE ?",
      like_string,
      like_string,
      like_string,
    ).limit(3).order('last_name asc')

    respond_to do |format|
      format.json {
        # render json: @customers.map{ |item| "#{item.last_name} #{item.first_name} #{item.middle_name}" },
        render json: @customers.map{ |item| { id: item.id, name: "#{item.last_name} #{item.first_name} #{item.middle_name}" } },
        status: :ok
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit( :first_name, :last_name, :middle_name, :email, :phone_mobile, :birthday, :gender, :description )
    end
end
