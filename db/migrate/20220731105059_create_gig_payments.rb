class CreateGigPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :gig_payments do |t|
      t.string :state, default: 'pending'
      t.belongs_to :gig, index: true

      t.timestamps
    end
  end
end
