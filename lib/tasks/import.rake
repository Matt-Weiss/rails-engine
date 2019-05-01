task import: [:environment] do
  require 'csv'
  Rake::Task["db:drop"].execute
  Rake::Task["db:create"].execute
  Rake::Task["db:migrate"].execute

  tables = ['merchants', 'customers', 'items', 'invoices', 'transactions', 'invoice_items']

  tables.each do |table|
    model_name = table.camelize.singularize.constantize
    CSV.foreach("db/data/#{table}.csv", :headers => true) do |row|
      model_name.create!(row.to_h)
    end
  end

end
