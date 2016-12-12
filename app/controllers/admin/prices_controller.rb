class Admin::PricesController < Admin::BaseController
before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.all.order( created_at: "desc" )
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        flash[:success] = 'Новый Абонемент успешно создан'
        format.html { redirect_to admin_prices_path }
        format.json { render :show, status: :created, price: @price }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Абонемента';
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        flash[:success] = 'Данные Абонемента успешно обновлены';
        format.html { redirect_to admin_prices_path }
        format.json { render :show, status: :ok, price: @price }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Абонемента'
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    respond_to do |format|
      flash[:danger] = 'Удаление Абонементов не предусмотрено';
      format.html { redirect_to admin_prices_path }
      format.json { head :no_content }
    end
  end

  private
    def set_price
      @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(
        :name, :status, :value, :period_start_type, :period_end_type,
        :period_end_days, :period_start_date, :period_end_date,
        :visit_limit_type, :visit_number, :visit_hour_number,
        :description, :no_scope_class_types, :no_scope_locations,
        :no_scope_users,

        # вложенные сущности со связкой many-to-many
        { :class_type_ids => [] },
        { :location_ids => [] },
        { :user_ids => [] },
      )
    end
end
