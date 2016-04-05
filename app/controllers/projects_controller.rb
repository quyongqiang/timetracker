class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    if (params[:slug])
      @project = Project.find_by slug: params[:slug]
    else
      @project = Project.find(params[:id])
    end
    @work = Work.new
    @work.project = @project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project].permit(:name, :default_rate, :slug, :company_id))
    if @project.save
      flash[:notice] = "Project Created"
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])  
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(params[:project].permit(:name, :default_rate, :slug, :company_id, :user_id))
      Usermailer.projectupdated_email(@project).deliver_now
      flash[:notice] = "Project Updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

end
