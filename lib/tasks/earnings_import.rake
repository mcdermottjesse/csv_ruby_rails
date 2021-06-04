namespace :import do #namespace allows same names to be added?

  desc "Import earnings from csv"
  task earning: :environment do
    counter = 0
    
    CSV.foreach("csv_files/earnings_doc.csv", headers: true) do |row|
      p row
      p row["Employee ID_doc"]
      p row["Earning Date_doc"]
      p row ["Amount_doc"]
      amount = Earning.create(employee_id: row["Employee ID_doc"],earning_date: row["Earning Date_doc"],amount: row["Amount_doc"])
      if amount.errors.any?
      puts "#{employee_id} - #{amount.errors.full_messages.join(",")}"
      end
      if amount.persisted? #Returns true if this object has been saved
      counter += 1 
      end
    end
    puts "Imported #{counter} amounts"
  end
end