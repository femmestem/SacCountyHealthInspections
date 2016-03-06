require "./config.rb"

def convert_to_csv(file_path)
  filename, dot, ext = file_path.split("/").last.rpartition(".")
  raise "Expected file extension 'txt' but saw '#{ext}' instead" unless ext == "txt"
  new_filename = File.expand_path(OUTPUT_DIR) + "/#{filename}.csv"

  write_csv(new_filename)
end

def write_csv(filename="new.csv")
  raise "'#{filename}'' exists" if File.exist? filename

  CSV.open("#{filename}", "ab") do |csv|
  end
end
