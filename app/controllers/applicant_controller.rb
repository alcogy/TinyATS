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
    @statuses = Status.all
    render "applicant/form"
  end

  def insert
  end

  def edit
    render "applicant/form"
  end

  def update
  end

  def delete
  end
end
