class Admin::LocationsController < Admin::BaseController
before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all.order( created_at: "desc" )
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        flash[:success] = 'Новый Филиал успешно создан'
        format.html { redirect_to admin_locations_path }
        format.json { render :show, status: :created, location: @location }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Филиала';
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        flash[:success] = 'Данные Филиала успешно обновлены';
        format.html { redirect_to [:admin, @location] }
        format.json { render :show, status: :ok, location: @location }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Филиала'
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      flash[:success] = 'Филиал успешно удалён';
      format.html { redirect_to admin_locations_path }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit( :name, :address, :description )
    end
end
