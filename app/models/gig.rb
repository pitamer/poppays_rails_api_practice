class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment
end
