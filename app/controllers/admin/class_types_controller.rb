class Admin::ClassTypesController < Admin::BaseController
before_action :set_class_type, only: [:show, :edit, :update, :destroy]

  # GET /class_types
  # GET /class_types.json
  def index
    @class_types = ClassType.all.order( created_at: "desc" )
  end

  # GET /class_types/1
  # GET /class_types/1.json
  def show
  end

  # GET /class_types/new
  def new
    @class_type = ClassType.new
  end

  # GET /class_types/1/edit
  def edit
  end

  # POST /class_types
  # POST /class_types.json
  def create
    @class_type = ClassType.new(class_type_params)

    respond_to do |format|
      if @class_type.save
        flash[:success] = 'Новое Занятие успешно создано'
        format.html { redirect_to admin_class_types_path }
        format.json { render :show, status: :created, location: @class_type }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Занятия';
        format.html { render :new }
        format.json { render json: @class_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_types/1
  # PATCH/PUT /class_types/1.json
  def update
    respond_to do |format|
      if @class_type.update(class_type_params)
        flash[:success] = 'Данные Занятия успешно обновлены';
        format.html { redirect_to [:admin, @class_type] }
        format.json { render :show, status: :ok, location: @class_type }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Занятия'
        format.html { render :edit }
        format.json { render json: @class_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_types/1
  # DELETE /class_types/1.json
  def destroy
    @class_type.destroy
    respond_to do |format|
      flash[:success] = 'Занятие успешно удалено';
      format.html { redirect_to admin_class_types_path }
      format.json { head :no_content }
    end
  end

  private
    def set_class_type
      @class_type = ClassType.find(params[:id])
    end

    def class_type_params
      params.require(:class_type).permit( :name )
    end
end
