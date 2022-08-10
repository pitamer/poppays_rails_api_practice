require 'rails_helper'

RSpec.describe Gig, type: :model do
  def create_mock_gig
    creator = Creator.new('first_name': "Chuck", 'last_name': "McGill")
    gig = Gig.create(brand_name: "HHM", creator_id: creator.id)
  end

  it 'is creatable' do
    gig = create_mock_gig
    expect(gig).to be_a_new Gig
    expect(gig.brand_name).to be_eql "HHM"
  end

  it 'automatically creates a new GigPayment when state is changed to completed' do
    # TODO: This test passes when the creator and gig are created in this scope, but it fails
    #  when they are created outside. I don't like it. Find a way to make it pass both ways.

    gig = create_mock_gig
    gig.set_completed

    gig_payment = GigPayment.find_by(gig_id: gig.id)
    expect(gig_payment).to be_a_new GigPayment
  end
end
