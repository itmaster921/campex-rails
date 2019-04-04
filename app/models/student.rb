class Student < ActiveRecord::Base
  has_one :registration_form
  belongs_to :nationality, foreign_key: "nationality_id", class_name: "Country"
  has_one :guardian
  belongs_to :reservation_category
  belongs_to :caste
  belongs_to :state
  belongs_to :district
  belongs_to :country
  belongs_to :comm_state, foreign_key: "comm_state_id", class_name: "State"
  belongs_to :comm_district, foreign_key: "comm_district_id", class_name: "District"
  belongs_to :board
  belongs_to :stream
  mount_uploader :profile_image, ImageUploader

  before_validation :check_if_same_address

  def subject_params=(subject_params)
    subject_params.each do |mark_details|
      mark = mark_details[1]
      unless mark[:score] == 0
        @mark = Mark.where(student_id: self.id, subject_position: mark_details[0]).first
        if @mark
          @mark.update(score: mark[:score], stream_subject_id: mark[:stream_subject_id])
        else
          Mark.create(student_id: self.id, stream_subject_id: mark[:stream_subject_id], score: mark[:score], subject_position:mark_details[0])
        end
      end
    end
  end

  def choice_params=(choice_params)
    choice_params.each do |choice|
      preference_no = choice[0].gsub("choice_", "").to_i
      programme_id = choice[1]

      @choice = Choice.where(preference: preference_no, student_id: self.id).first
      if @choice
        @choice.update(programme_id: programme_id)
      else
        Choice.create(preference: preference_no, student_id: self.id, programme_id: programme_id)
      end
    end
  end

  protected
    def check_if_same_address
      if self.same_address
        address_fields = ['address_line1', 'address_line2', 'country_id', 'state_id',
           'district_id', 'taluk', 'post_office', 'pincode']
        address_fields.each do |field|
          eval("self.comm_#{field} = self.#{field}")
        end
      end
    end
end
