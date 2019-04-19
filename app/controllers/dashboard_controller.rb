class DashboardController < ApplicationController
  def index
  end

  # def instructions
  #   if request.post?
  #     @origin_step = RegistrationStep.find_by_name('Instructions')
  #     @registration_form = current_user.registration_form
  #     unless @registration_form.instructions_read
  #       @registration_form.increment(:current_step)
  #       @registration_form.update(instructions_read: true)
  #     end
  #     render :proceed2_next
  #   end
  # end

  def personal
  end

  def address
  end

  def guardian
  end

  def weightages
  end

  def education
  end

  def marks
  end

  def choices
  end

  def submission
  end

  def submission_done
    current_user.update(submission_done: true)
    current_user.registration_form.update(current_step: 7)
    flash[:notice] = "You have successfully completed registration! Please visit us back when rank lists are published! "
    redirect_to dashboard_index_url
  end

  def phase_completed
  end

  def update_menu
  end

  def generate_index_pdf
    @programmes = []
    @choices = []
    Programme.where(disabled: false).order(:name).each do |prog|
      next if prog.indexing_rules.nil?
      @programmes << prog
      @choices << Choice.select(:student_id, :index_mark).where(programme_id: prog.id).order(index_mark: :desc)
    end
  end
end
