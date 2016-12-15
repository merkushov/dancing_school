class Admin::ClassGroupsController < Admin::BaseController
  before_action :set_class_group, only: [:show, :edit, :update, :destroy,
    :add_customer, :delete_customer]

  # GET /class_groups
  # GET /class_groups.json
  def index
    @class_groups = ClassGroup.all.order( created_at: "desc" )
  end

  # GET /class_groups/1
  # GET /class_groups/1.json
  def show
    # все ученики, привязанные к группе
    @customers = @class_group.customers.all
  end

  # GET /class_groups/new
  def new
    @class_group = ClassGroup.new
  end

  # GET /class_groups/1/edit
  def edit
  end

  # POST /class_groups
  # POST /class_groups.json
  def create
    @class_group = ClassGroup.new(class_group_params)

    respond_to do |format|
      if @class_group.save
        flash[:success] = 'Новая Группа Учеников успешно создано'
        format.html { redirect_to admin_class_groups_path }
        format.json { render :show, status: :created, location: @class_group }
      else
        flash[:danger] = 'Возникли некоторые проблемы с созданием новой Группы Учеников';
        format.html { render :new }
        format.json { render json: @class_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_groups/1
  # PATCH/PUT /class_groups/1.json
  def update
    respond_to do |format|
      if @class_group.update(class_group_params)
        flash[:success] = 'Данные Группы Учеников успешно обновлены';
        format.html { redirect_to [:admin, @class_group] }
        format.json { render :show, status: :ok, location: @class_group }
      else
        flash[:danger] = 'Возникли проблемы с обновлением данных Группы Учеников'
        format.html { render :edit }
        format.json { render json: @class_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_groups/1
  # DELETE /class_groups/1.json
  def destroy
    @class_group.destroy
    respond_to do |format|
      flash[:success] = 'Группа Учеников успешно удалена';
      format.html { redirect_to admin_class_groups_path }
      format.json { head :no_content }
    end
  end

  # POST /class_groups/<id>/add_customer/<customer_id>
  # POST /class_groups/<id>/add_customer/<customer_id>.json
  def add_customer
    customer = Customer.find(params[:customer_id])
    respond_to do |format|
      if @class_group.customers.exists?( customer )
        flash[:danger] = 'Ученик уже находится в Группе';
        format.html { redirect_to [:admin, @class_group] }
        format.json { render :show, status: :ok, location: @class_group }
      elsif @class_group.customers << customer
        # flash[:success] = 'Ученик успешно добавлен в Группу';
        format.html { redirect_to [:admin, @class_group] }
        format.json { render :show, status: :ok, location: @class_group }
      else
        flash[:danger] = 'Возникли проблемы с добавлением Ученика к Группе'
        format.html { redirect_to [:admin, @class_group] }
        format.json { render json: @class_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /class_groups/<id>/delete_customer/<customer_id>
  # POST /class_groups/<id>/delete_customer/<customer_id>.json
  def delete_customer
    customer = Customer.find(params[:customer_id])
    respond_to do |format|
      if @class_group.customers.delete( customer )
        # flash[:success] = 'Ученик успешно удалён из Группы';
        format.html { redirect_to [:admin, @class_group] }
        format.json { render :show, status: :ok, location: @class_group }
      else
        flash[:danger] = 'Возникли проблемы с удалением Ученика из Группы'
        format.html { redirect_to [:admin, @class_group] }
        format.json { render json: @class_group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_class_group
      @class_group = ClassGroup.find(params[:id])
    end

    def class_group_params
      params.require(:class_group).permit( :name, :description )
    end
end
