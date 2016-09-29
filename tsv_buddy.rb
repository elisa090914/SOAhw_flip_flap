# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  attr_reader :tsv
  attr_accessor :data, :tsv_str

  def take_tsv(tsv)
    @data = []
    lines = tsv.split("\n")
    header = lines[0].split("\t")
    lines.shift # remove header
    lines.each do |line|
      values = line.split("\t")
      record = values.map.with_index { |value, i| [header[i], value] }.to_h
      @data << record
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @tsv_str = []
    @tsv_str << @data[0].keys.join("\t") # header
    @tsv_str << @data.map { |record| record.values.join("\t") }
    @tsv_str.join("\n") + "\n" # add a line break at the end of last row
  end
end
