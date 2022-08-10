require 'rails_helper'

RSpec.describe Creator, type: :model do
  it 'is creatable' do
    creator = Creator.new('first_name': "Walter", 'last_name': "White")
    expect(creator).to be_a_new Creator
    expect(creator.first_name).to be_eql "Walter"
    expect(creator.last_name).to be_eql "White"
  end
end
