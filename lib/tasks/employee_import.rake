
namespace :import do

  desc "Import employees from csv"
  task employee: :environment do
    counter = 0
    
    CSV.foreach("csv_files/employee_doc.csv", headers: true) do |row|
      p row
      p row["EmployerID_doc"]
      p row["ID_doc"]
      p row["Name_doc"]
      p row["External_Ref_doc"]
      employee = Employee.create(employer_id: row["EmployerID_doc"],id: row["ID_doc"],name: row["Name_doc"],external_ref: row["External_Ref_doc"])
      puts "#{name} - #{employee.errors.full_messages.join(",")}" if employee.errors.any?
      counter += 1 if employee.persisted?
    end
    puts "Imported #{counter} employees"
  end
end