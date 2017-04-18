class Cat < ApplicationRecord
  KITTY_COLORS = ['Black','White','Brown','Orange','Grey','Golden']

  validates :color, :name, :sex, presence: true
  validates :color, inclusion: KITTY_COLORS
  validates :sex, inclusion: ['M', 'F']

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    return nil if birth_date.nil?
    age = Date.today.year - birth_date.year
    Date.today < birth_date + age.years ? age - 1 : age
  end

end
