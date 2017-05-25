class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.new(job_params)

    if @job.save
      redirect_to jobs_path, notice: "新增工作成功"
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = current_user.job.find(params[:id])
  end

  def update
    @job = current_user.job.find(params[:id])

    if @job.update(job_params)
      redirect_to jobs_path, notice: "修改工作成功"
    else
      render :edit
    end
  end

  def destroy
    @job = current_user.job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "刪除工作成功"
  end

  def fulltime
    @jobs = Job.where(job_class: "full-time")
  end

  def parttime
    @jobs = Job.where(job_class: "part-time")
  end

  def freelance
    @jobs = Job.where(job_class: "freelance")
  end

  def remote
    @jobs = Job.where(job_class: "remote")
  end

  private

  def job_params
    params.require(:job).permit(:job_class, :job_type, :company, :description, :link)
  end
end
