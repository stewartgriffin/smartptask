class VisitCounter
  def initialize
    @ips = Hash.new
  end

  def update(url, ip)
    @ips[ip] = Hash.new
    @ips[ip][url] = 1
  end
  
  def visits
    return @ips.empty? ? 0 : 1
  end

  def unique_visits
    return @ips.empty? ? 0 : 1    
  end
end
