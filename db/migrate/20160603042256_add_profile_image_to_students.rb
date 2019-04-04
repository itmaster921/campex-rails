class AddProfileImageToStudents < ActiveRecord::Migration
  def change
    add_column :students, :profile_image, :string
  end
end
