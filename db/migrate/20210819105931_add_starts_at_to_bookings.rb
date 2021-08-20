class AddStartsAtToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :starts_at, :string
  end
end
