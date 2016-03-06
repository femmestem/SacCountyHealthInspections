require "./config.rb"

def convert_to_csv(file_path)
  filename, dot, ext = file_path.split("/").last.rpartition(".")
  raise "Expected file extension 'txt' but saw '#{ext}' instead" unless ext == "txt"
  new_filename = File.expand_path(OUTPUT_DIR) + "/#{filename}.csv"
  parsed_rows = parse_text(file_path)

  write_csv(parsed_rows, new_filename) unless parsed_rows.nil?
end

def write_csv(rows_array, filename="new.csv")
  raise "'#{filename}'' exists" if File.exist? filename

  CSV.open("#{filename}", "ab") do |csv|
    rows_array.each { |row| csv << row }
  end
end

def parse_text(file)
   records =[COLUMN_HEADERS, [1,2,3]]
end
