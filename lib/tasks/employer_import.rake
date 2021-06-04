
namespace :import do

  desc "Import employers from csv"
  task employer: :environment do
    counter = 0
    
    CSV.foreach("csv_files/employer_doc.csv", headers: true) do |row|
      p row
      p row["ID_doc"]
      p row["Name_doc"]
      employer = Employer.create(id: row["ID_doc"],name: row["Name_doc"])
      if employer.errors.any?
      puts "#{name} - #{employer.errors.full_messages.join(",")}"
      end
      if employer.persisted? #Returns true if this object has been saved
      counter += 1 
      end
    end
    puts "Imported #{counter} employers"
  end
end