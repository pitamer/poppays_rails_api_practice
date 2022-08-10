require 'rails_helper'

RSpec.describe GigPayment, type: :model do
  def create_mock_gig_payment
    creator = Creator.new('first_name': "Gustavo", 'last_name': "Fring")
    gig = Gig.create(brand_name: "Los Pollos Hermanos", creator_id: creator.id)
    gig_payment = GigPayment.new(gig_id: gig.id)
  end

  it 'is creatable' do
    gig_payment = create_mock_gig_payment
    expect(gig_payment).to be_a_new GigPayment
  end

  it 'defaults to "pending" as initial state' do
    gig_payment = create_mock_gig_payment
    expect(gig_payment.state).to be_eql "pending"
  end
end
