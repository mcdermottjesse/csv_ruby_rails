require 'csv'

data_string = "ID;Name\n21;Larry\n22;Linda"

CSV.parse(data_string, :col_sep => ';') do |row|

p row
end
