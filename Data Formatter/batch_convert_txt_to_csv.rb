require "./config.rb"
require "./text_to_csv"

# ALL_TXT_REPORTS.count # 4959

BATCH1 = ALL_TXT_REPORTS.slice(0, 200)
BATCH2 = ALL_TXT_REPORTS.slice(200, 200)
BATCH3 = ALL_TXT_REPORTS.slice(400, 200)
BATCH4 = ALL_TXT_REPORTS.slice(600, 200)
BATCH4b = ALL_TXT_REPORTS.slice(719, 81) # Errors on 718, FA0002709.txt
BATCH5 = ALL_TXT_REPORTS.slice(800, 200)
BATCH5b = ALL_TXT_REPORTS.slice(915, 85) # Errors on 914, FA0003155.txt
BATCH6 = ALL_TXT_REPORTS.slice(1000, 200)
BATCH6b = ALL_TXT_REPORTS.slice(1176, 24) # Errors on 1175, FA0003655.txt
BATCH7 = ALL_TXT_REPORTS.slice(1200, 200)
BATCH7b = ALL_TXT_REPORTS.slice(1234, 165) # Errors on 1233, FA0003793.txt
BATCH8 = ALL_TXT_REPORTS.slice(1400, 200)
BATCH9 = ALL_TXT_REPORTS.slice(1600, 200)
BATCH10 = ALL_TXT_REPORTS.slice(1800, 200)
BATCH11 = ALL_TXT_REPORTS.slice(2000, 200)
BATCH12 = ALL_TXT_REPORTS.slice(2200, 200)
BATCH13 = ALL_TXT_REPORTS.slice(2400, 200)
BATCH14 = ALL_TXT_REPORTS.slice(2600, 200)
BATCH14b = ALL_TXT_REPORTS.slice(2708, 92) # Error on 2707, FA0013080.txt
BATCH15 = ALL_TXT_REPORTS.slice(2800, 200)
BATCH16 = ALL_TXT_REPORTS.slice(3000, 200)
BATCH17 = ALL_TXT_REPORTS.slice(3200, 200)
BATCH18 = ALL_TXT_REPORTS.slice(3400, 200)
BATCH18b = ALL_TXT_REPORTS.slice(3523, 76) # Error on 3522, FA0019939.txt & 3599, FA0028690.txt
BATCH19 = ALL_TXT_REPORTS.slice(3600, 200)
BATCH20 = ALL_TXT_REPORTS.slice(3800, 200)
BATCH20b = ALL_TXT_REPORTS.slice(3851,48) # Error on 3850, FA0031287.txt
BATCH20c = ALL_TXT_REPORTS.slice(3887, 113) # Error on 3886, FA0031618.txt
BATCH21 = ALL_TXT_REPORTS.slice(4000, 200)
BATCH22 = ALL_TXT_REPORTS.slice(4200, 200)
BATCH23 = ALL_TXT_REPORTS.slice(4400, 200)
BATCH24 = ALL_TXT_REPORTS.slice(4600, 200)
BATCH25 = ALL_TXT_REPORTS.slice(4800, 200)

def run_batch_conversion(batch_arr)
  batch_arr.each do |report|
    convert_to_csv "#{INPUT_DIR}#{report}"
  end
end

run_batch_conversion(BATCH24)
# p ALL_TXT_REPORTS[4799]
