class CreatorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  has_many :gigs
end
