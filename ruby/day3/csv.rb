# End of Day 3 in seven languages in seven weeks, with one caveat.
# I suspected this system of overriding include in order to extend
# was a bit funky, and indeed after some googling discovered that
# yehuda katz himself suggested that this isn't the best way.

# Instead, you can use the "extend" keyword to extend the methods in
# a module as class methods.
# http://yehudakatz.com/2009/11/12/better-ruby-idioms/
module ActsAsCsv
  def acts_as_csv
    include InstanceMethods
  end

  module InstanceMethods
    class CsvRow
      # There's probably a better way to access things from the parent module
      # than passing args to the initialize method
      def initialize(row_array, headers)
        @row_array = row_array
        @headers = headers
      end

      def method_missing(name)
        name_str = name.to_s
        @row_array[@headers.index(name_str)]
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << (CsvRow.new row.chomp.split(', '), @headers)
      end
    end

    def each(&block)
      @csv_contents.each(&block)
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv
  extend ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each { |row| puts row.some }
