class TasksController < ApplicationController
  def new
    @task = Task.new
    render :form
  end

  def index
	 # Just the tasks of the current user
	 # Works because of the has_many relation
     @tasks = current_user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize! :create, @task
    save_task
  end

  def edit
    @task = Task.find(params[:id])
    authorize! :edit, @task
    render :form
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)
    authorize! :update, @task
    save_task
  end

  def destroy
    @task = Task.find(params[:id])
    authorize! :destroy, @task
    @task.destroy
    @tasks = Task.accessible_by(current_ability)
    redirect_to '/'
  end

  private

  def save_task
    if @task.save
      @tasks = Task.accessible_by(current_ability)
      redirect_to '/'
    else
      render :form
    end
  end

  def task_params
	# If we want to use a param (e.g. description), we have to permit the usage
    params.require(:task).permit(:title, :description, :category, :due_date)
  end
end