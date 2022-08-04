class GigPayment < ApplicationRecord
  belongs_to :gig

  include AASM

  aasm column: :state do
    state :pending, initial: true
    state :completed

    event :set_completed do
      transitions from: :pending, to: :completed, after: Proc.new { self.gig.set_paid! }
    end
  end
end
