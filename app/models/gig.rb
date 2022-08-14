class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment

  include AASM

  def create_related_gig_payment
    unless self.gig_payment
      GigPayment.create(gig_id: self.id)
    end
  end

  aasm column: :state do
    state :applied, initial: true
    state :completed, :accepted, :paid

    event :accept do
      transitions from: :applied, to: :accepted
    end

    event :complete do
      transitions from: [:applied, :completed, :accepted], to: :completed, after: :create_related_gig_payment
    end

    event :pay do
      transitions from: [:applied, :completed, :accepted], to: :paid
    end
  end
end
