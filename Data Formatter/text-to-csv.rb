require "./config.rb"

def convert_to_csv(file_path)
  @filename, dot, ext = File.basename(file_path).rpartition(".")
  raise "Expected file extension 'txt' but saw '#{ext}' instead" unless ext == "txt"

  @original_file_path = File.expand_path(INPUT_DIR) + "/#{@filename}.#{ext}"
  @new_file_path = File.expand_path(OUTPUT_DIR) + "/#{@filename}.csv"

  write_csv(parse_contents, @new_file_path) unless parse_contents.empty?
end

def write_csv(rows_array, filename="new.csv")
  raise "'#{filename}'' exists" if File.exist? filename

  puts "Writing to '#{filename}'..."
  CSV.open("#{filename}", "ab") do |csv|
    rows_array.each { |row| csv << row }
  end
end

def parse_contents
  @contents = File.readlines(@original_file_path)
  parsed_rows = [COLUMN_HEADERS]
  facility_info = get_facility_info

  parsed_rows.push facility_info
end

def get_facility_info
  info = []
  i = 0

  while info.length < (COLUMN_HEADERS.length - 1) do
    candidate = @contents[i].match(/^\w+\s?\w*\:\s/i)

    if candidate
      header = format_as_header candidate
    end

    if COLUMN_ORDER.has_key? header
      info[COLUMN_ORDER[header]] ||= @contents[i].sub(candidate.to_s, "").strip
    end

    i += 1
  end

  info
end

def format_as_header(str)
  header = str.to_s.downcase
  header.gsub!(": ", "")
  header.gsub!(" ", "_")
  header.to_sym
end
