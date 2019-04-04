class AddSubmissionDoneToStudents < ActiveRecord::Migration
  def change
    add_column :students, :submission_done, :boolean, default: false
  end
end
