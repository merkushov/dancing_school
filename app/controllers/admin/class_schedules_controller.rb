class Admin::ClassSchedulesController < Admin::BaseController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy]

  # GET /class_schedules
  # GET /class_schedules.json
  def index
    @class_schedules = ClassSchedule.all.order( created_at: "desc" )
  end

  # GET /class_schedules/1
  # GET /class_schedules/1.json
  def show
  end

  # GET /class_schedules/new
  def new
    @class_schedule = ClassSchedule.new
  end

  # GET /class_schedules/1/edit
  def edit
  end

  # POST /class_schedules
  # POST /class_schedules.json
  def create
    @class_schedule = ClassSchedule.new(class_schedule_params)

    @class_schedule.user_id = 1
    @class_schedule.class_type_id = 1
    @class_schedule.location_id = 1

    respond_to do |format|
      if @class_schedule.save
        flash[:success] = 'Новое Занятие успешно создано'
        format.html { redirect_to admin_class_schedules_path }
        format.json { render :show, status: :created, location: @class_schedule }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием нового Занятия';
        format.html { render :new }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_schedules/1
  # PATCH/PUT /class_schedules/1.json
  def update
    respond_to do |format|
      if @class_schedule.update(class_schedule_params)
        flash[:success] = 'Данные Занятия успешно обновлены';
        format.html { redirect_to [:admin, @class_schedule] }
        format.json { render :show, status: :ok, location: @class_schedule }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данныех Занятия'
        format.html { render :edit }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_schedules/1
  # DELETE /class_schedules/1.json
  def destroy
    @class_schedule.destroy
    respond_to do |format|
      flash[:success] = 'Занятие успешно удалено';
      format.html { redirect_to admin_class_schedules_path }
      format.json { head :no_content }
    end
  end

  private
    def set_class_schedule
      @class_schedule = ClassSchedule.find(params[:id])
    end

    def class_schedule_params
      params.require(:class_schedule).permit( :date_begin, :date_end, :cost, :class_type_id, :location_id, :user_id )
    end
end
