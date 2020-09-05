class JobsController < ApplicationController
 before_action :authenticate_user!, except: :show
  def index
  end

  def new
    @job = JOb.new
  end

  def create
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] ="求人が保存されました"
      redirecto_to @job
    else
      flash[:alert] ="募集作成に失敗しました"
    end
  end

private
  def job_params
   params.require(:job).permit(:title, :content).merge(user_id: current_user.id)
 end
end
