class Cat < ApplicationRecord
  KITTY_COLORS = ['black','white','brown','orange','grey','golden']

  validates :color, :name, :sex, presence: true
  validates :color, inclusion: KITTY_COLORS
  validates :sex, inclusion: ['M', 'F']

  def age
    return nil if birth_date.nil?
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years
  end


end
