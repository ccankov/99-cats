class CatRentalRequest < ApplicationRecord
  RENTAL_STATUSES = ['PENDING', 'APPROVED', 'DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: RENTAL_STATUSES
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .where('start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?',
             start_date, end_date, start_date, end_date)
      .where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:base] << "Overlaps another approved request"
    end
  end

  


end
