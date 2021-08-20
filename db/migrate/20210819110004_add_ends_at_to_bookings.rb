class AddEndsAtToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :ends_at, :string
  end
end
