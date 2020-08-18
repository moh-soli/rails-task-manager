class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task].permit(:title, :details))
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task].permit(:title, :details, :completed))
     redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

end
