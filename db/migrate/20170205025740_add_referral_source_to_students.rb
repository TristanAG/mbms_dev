class AddReferralSourceToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :referral_source, :string
  end
end
