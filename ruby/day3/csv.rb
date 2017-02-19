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
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
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
puts m.headers.inspect
puts m.csv_contents.inspect
