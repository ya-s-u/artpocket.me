class SchedulesController < ApplicationController

  def index
    set_time = Time.now
    if params[:year_month] != nil
      params[:year_month].match(/^([0-9]{4})([0-9]{2})$/) do |param|
        set_time = Time.mktime(param[1].to_i, param[2].to_i, 01, 00, 00, 00)
      end
    end

    @from = set_time.beginning_of_month
    to = set_time.end_of_month

    @schedules = Post.where("(open_date <= ? AND ? <= close_date)OR(? <= open_date AND close_date <= ?)OR(open_date <= ? AND ? <= close_date)", @from, @from, @from, to, to, to).order(open_date: :desc)

    @size = set_time.at_end_of_month.day
    @calendar = Array.new(@schedules.length){ Array.new(@size) }
    @schedules.each_with_index do |post, i|
      for j in 0..@size do
        day = @from + j.day
        @calendar[i][j] = post.open_date <= day && day <= post.close_date ? true: false
      end
    end
  end

end
