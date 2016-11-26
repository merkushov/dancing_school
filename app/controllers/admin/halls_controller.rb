class Admin::HallsController < Admin::BaseController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]

  # GET /halls
  # GET /halls.json
  def index
    @halls = Hall.all.order( created_at: "desc" )
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
  end

  # GET /halls/new
  def new
    @hall = Hall.new
  end

  # GET /halls/1/edit
  def edit
  end

  # POST /halls
  # POST /halls.json
  def create
    @hall = Hall.new(hall_params)

    respond_to do |format|
      if @hall.save
        flash[:success] = 'Новый Зал успешно создан'
        format.html { redirect_to admin_halls_path }
        format.json { render :show, status: :created, hall: @hall }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Зала';
        format.html { render :new }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /halls/1
  # PATCH/PUT /halls/1.json
  def update
    respond_to do |format|
      if @hall.update(hall_params)
        flash[:success] = 'Данные Зала успешно обновлены';
        format.html { redirect_to [:admin, @hall] }
        format.json { render :show, status: :ok, hall: @hall }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Зала'
        format.html { render :edit }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /halls/1
  # DELETE /halls/1.json
  def destroy
    @hall.destroy
    respond_to do |format|
      flash[:success] = 'Зал успешно удалён';
      format.html { redirect_to admin_halls_path }
      format.json { head :no_content }
    end
  end

  private
    def set_hall
      @hall = Hall.find(params[:id])
    end

    def hall_params
      params.require(:hall).permit( :location_id, :name, :description )
    end
end
