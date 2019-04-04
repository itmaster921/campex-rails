class AddPaymentMadeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :payment_made, :boolean, deafult: false
  end
end
