class ReportsController < ApplicationController
  def consolidated_report_selection
  end

  def consolidated_report
    @programme = Programme.where(id: params[:admin][:programme_id]).select("id, name").first

    @student_ids = Student.joins("INNER JOIN choices ON choices.student_id = students.id")
    .where("programme_id = #{@programme.id} AND rank > 0 AND status!= 'EL'")
    .order("rank ASC")
    .pluck("DISTINCT students.id")

    render layout: false
  end

  def index_marks
  end

  def generate_index_pdf
    @programmes = []
    @programmes << Programme.find(params[:admin][:programme_id])
    @choices = []
    @choices << Choice.select(:student_id, :index_mark).where(programme_id: params[:admin][:programme_id]).order(index_mark: :desc)
  end
end
