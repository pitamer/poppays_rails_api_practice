class GigPaymentSerializer < ActiveModel::Serializer
  attributes :id, :gig_id, :state

  belongs_to :gig
end
