class GigSerializer < ActiveModel::Serializer
  attributes :id, :brand_name, :creator_id, :state

  belongs_to :creator
  has_one :gig_payment
end
