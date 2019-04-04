class ChoicesController < ApplicationController
  before_action :set_choices
  before_action :set_choice, only: [:show, :edit, :update, :destroy]

  # GET students/1/choices
  def index
    @choices = @student.choices
  end

  # GET students/1/choices/1
  def show
  end

  # GET students/1/choices/new
  def new
    @choice = @student.choices.build
  end

  # GET students/1/choices/1/edit
  def edit
  end

  # POST students/1/choices
  def create
    @choice = @student.choices.build(choice_params)

    if @choice.save
      redirect_to([@choice.student, @choice], notice: 'Choice was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT students/1/choices/1
  def update
    if @choice.update_attributes(choice_params)
      redirect_to([@choice.student, @choice], notice: 'Choice was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE students/1/choices/1
  def destroy
    @choice.destroy

    redirect_to student_choices_url(@student)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choices
      @student = Student.find(params[:student_id])
    end

    def set_choice
      @choice = @student.choices.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def choice_params
      params.require(:choice).permit(:preference, :programme_id, :index_mark, :rank, :status, :general, :sc, :st, :muslim, :handicapped, :obc, :obh, :etb, :latin, :disabled)
    end
end
