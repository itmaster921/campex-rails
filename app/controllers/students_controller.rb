class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        redirect_to url_for(:controller => :dashboard, :action => :photo_upload) and return if student_params[:profile_image]
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
        format.js do
          @registration_form = current_user.registration_form
          @origin_step = RegistrationStep.find_by_name(params[:step_name])
          if @registration_form.current_step == @origin_step.position
            @registration_form.increment(:current_step)
            @registration_form.save
          end

          render :template => 'dashboard/proceed2_next'
        end
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js do
          render :template => 'dashboard/proceed2_next'
        end
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:email, :name, :gender, :profile_image, :dob, :blood_group, :religion,
      :reservation_category_id, :nationality_id, :aadhar_no, :birth_place, :mobile_no, :phone_no,
      :address_line1, :address_line2, :country_id, :state_id, :district_id, :taluk, :post_office,
      :pincode, :comm_address_line1, :comm_address_line2, :comm_country_id, :comm_state_id, :comm_district_id,
      :comm_taluk, :comm_post_office, :comm_pincode, :born_in, :caste_id, :same_address, :blind, :deaf,
      :orthopedic, :ex_service, :nss, :ncc, :arts, :sports, :no_of_chances, :illiteracy_eradication,
      :board_id, :stream_id, :tenth_yos, :tenth_yop, :tenth_regno, :tenth_institution, :twelfth_yos,
      :twelfth_yop, :twelfth_regno, :twelfth_institution, :twelfth_tc_no, :twelfth_tc_date,
      subject_params: [:stream_subject_id, :score], choice_params: [:choice_1, :choice_2, :choice_3, :choice_4, :choice_5] )
    end
end
