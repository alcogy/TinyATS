class ApplicantController < ApplicationController
  def index
    @list = Applicant.all
    status = Status.all
    master = {}
    status.each do |s|
      master[s.id] = s.label
    end
    @statuses = master
    render "applicant/index"
  end

  def create
    @applicant = Applicant.new
    @statuses = Status.all
    @action = "/create"
    render "applicant/form"
  end

  def insert
    post = params[:applicant]
    applicant = Applicant.new
    applicant.name = post[:name]
    applicant.status = post[:status]
    applicant.save()

    redirect_to("/")
  end

  def edit
    @applicant = Applicant.find(params[:id])
    @statuses = Status.all
    @action = "/edit"
    render "applicant/form"
  end

  def update
    post = params[:applicant]
    applicant = Applicant.find(post[:id])
    applicant.name = post[:name]
    applicant.status = post[:status]
    applicant.save()

    redirect_to("/")
  end

  def delete
    id = params[:id]
    p(id)
    Applicant.find(id).destroy
    redirect_to("/")
  end
end
