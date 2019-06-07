require_relative 'visit_counter'

class Parser
  def initialize(input)
    @counter = VisitCounter.new
    read(input)
  end

  def visits
    @counter.visits
  end

  def unique_visits
    @counter.unique_visits
  end

  def pages_most_viewed
    output = String.new
    sorted = @counter.paths.sort_by {|k, v| 
                         result = 0
			 v.each {|kk, vv|
                                result += vv
                                }
                        -result}
    sorted.each do |path, ip|
	output += path.to_s + "\n"
    end
    output
  end

  def pages_most_unique_viewed
    output = String.new
    sorted = @counter.paths.sort_by {|k, v|  
			result = 0
			v.each {|kk, vv|
				result += 1
				}
			-result} 
    sorted.each do |path, ip|
        output += path.to_s + "\n"
    end
    output
  end
private
  def read(input)
    input.each_line do |line|
      split_line = line.split(" ")
      @counter.update(split_line[0], split_line[1])
    end
  end
end
