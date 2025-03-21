class ScheduleController < ApplicationController
  def index
    @applicants = Applicant.all
    aps = {}
    @applicants.each do |a|
      aps[a.id] = a.name
    end
    @names = aps
    day = Date.today.wday
    from = day.days.ago.strftime("%Y-%m-%d 00:00:00")
    to = (6 - day).days.after(Date.today).strftime("%Y-%m-%d 23:59:59")

    data = {}
    sch = Schedule.where(date: (from)..(to))
    sch.each do |s|
      data[s.date.strftime("%y/%m/%dT%H")] = s
    end
    @schedules = data

    @date = day.days.ago
    render "index"
  end

  def post
    s = Schedule.new
    s.date = params[:date].to_s + " " + params[:time].to_s
    s.applicant_id = params[:applicant_id]
    s.remark = params[:remark]
    s.save

    redirect_to("/schedule")
  end

  def delete
    id = params[:id]
    Schedule.find(id).destroy
    redirect_to("/schedule")
  end
end
