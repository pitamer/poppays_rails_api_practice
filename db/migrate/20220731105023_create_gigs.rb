class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :brand_name
      t.string :state, default: 'applied'
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end
