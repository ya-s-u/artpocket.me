class SchedulesController < ApplicationController

  def index
    @from = Time.now.beginning_of_month
    to = Time.now.end_of_month

    @schedules = Post.where("(open_date <= ? AND ? <= close_date)OR(? <= open_date AND close_date <= ?)OR(open_date <= ? AND ? <= close_date)", @from, @from, @from, to, to, to).order(open_date: :desc)

    @size = Time.now.at_end_of_month.day
    @calendar = Array.new(@schedules.length){ Array.new(@size) }
    @schedules.each_with_index do |post, i|
      for j in 0..@size do
        day = @from + j.day
        @calendar[i][j] = post.open_date <= day &&  day <= post.close_date ? true: false
      end
    end
  end

end
