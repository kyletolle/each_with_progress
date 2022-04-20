class Enumerator
  def with_progress(&block)
    total_count     = self.count
    total_processed = 0

    self.each do |item|
      yield item

      total_processed += 1
      print_interval_reached = total_processed == 1 || (total_processed % 10).zero? || total_processed == total_count
      print "\r#{total_processed} of #{total_count}." if print_interval_reached
    end
    puts
  end
end

#Note: This is how we use this...
# puts "Processing some items..."
# 60.times.with_progress do |item|
#   sleep 0.1
# end
# puts "Finished processing items."

