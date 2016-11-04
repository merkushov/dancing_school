class Admin::VisitsController < Admin::BaseController
  before_action :set_visit, only: [:update, :destroy]

  def list_by_class_schedule
    @class_schedule = ClassSchedule.find(params[:class_schedule_id])
    @visits = @class_schedule.visits

    respond_to do |format|
      # flash[:success] = 'Новое Посещение успешно создано'
      format.html { render "list" }
      format.json {
        render json: {},
        status: :ok
      }
    end
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    class_schedule = @visit.class_schedule

    respond_to do |format|
      if @visit.save
        flash[:success] = 'Новое Посещение успешно создано'
        format.html { redirect_to admin_class_schedule_path(class_schedule) }
        format.json {
          render json: {
            message: 'Новое Посещение успешно создано',
            status: 'success',
          },
          status: :created
        }
      else
        error_message = ""
        @visit.errors.full_messages.each do |msg|
          error_message = error_message + msg + " "
        end

        # TODO: сообщение выглядит как "Class schedule Одно занятие можно посетить только один раз"
        #   разобраться откуда Class schedule и убрать его из строки

        flash[:danger] = error_message
        format.html { redirect_to admin_class_schedule_path(class_schedule) }
        format.json {
          render json: {
            message: error_message,
            status: 'danger',
          },
          status: :unprocessable_entity
        }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update( is_paid: params[:is_paid] )
        # flash[:success] = 'Данные Посещения успешно обновлены'
        # format.html { render 'OK' }
        format.json {
          render json: {
            status: 'success',
            message: 'Данные Посещения успешно обновлены',
          },
          status: :ok
        }
      else
        # flash[:danger] = 'Возникли проблемы с обновлением Посещения'
        # format.html { render 'ERROR' }
        format.json {
          render json: {
            status: 'danger',
            message: @visit.errors,
          },
          status: :unprocessable_entity
        }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    class_schedule = @visit.class_schedule
    @visit.destroy
    respond_to do |format|

      format.html { redirect_to admin_class_schedule_path(class_schedule) }

      # format.json {
      #   render json: {
      #     status: 'success',
      #     message: 'Посещение успешно удалено',
      #   },
      #   status: :ok
      # }
    end
  end

  private
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def visit_params
      params.require(:visit).permit( :class_schedule_id, :customer_id, :is_paid )
    end
end
