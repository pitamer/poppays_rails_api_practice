class GigPayment < ApplicationRecord
  belongs_to :gig

  include AASM

  aasm column: :state do
    state :pending, initial: true
    state :completed

    event :complete do
      transitions from: :pending, to: :completed, after: Proc.new { self.gig.pay! }
    end
  end
end
