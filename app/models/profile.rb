class Profile < ActiveRecord::Base
  belongs_to :user
  validate :name_nil

  def name_nil
    if !first_name & !last_name
      errors.add(:last_name, "First and last name cannot both be null")
    end
  end

  validates_inclusion_of :gender, :in => ["male", "female"]
  validates :first_name, exclusion: ["Sue"], if: "gender == 'male'"

end
