task import: :environment do
  require 'csv'

  CSV.foreach('db/data/merchants.csv', :headers => true) do |row|
    Merchant.create!(row.to_hash)
  end

end
