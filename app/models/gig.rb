class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment

  include AASM

  def create_related_gig_payment
    unless self.gig_payment
      @gig_payment = GigPayment.create(gig_id: self.id)
    end
  end

  aasm column: :state do
    state :applied, initial: true
    state :completed, :accepted, :paid

    event :set_paid do
      transitions from: [:applied, :completed, :accepted], to: :paid
    end

    event :set_completed do
      transitions from: [:applied, :completed, :paid], to: :accepted, after: :create_related_gig_payment
    end
  end
end
