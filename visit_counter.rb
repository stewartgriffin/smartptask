class VisitCounter
  def initialize
    @paths = Hash.new
  end

  def update(path, ip)
    @paths[path] = Hash.new unless @paths.key? path
    @paths[path][ip] = 0 unless @paths[path].key? ip
    @paths[path][ip] += 1
  end 
  
  def visits
    count_visits false
  end

  def unique_visits
    count_visits true
  end

  def paths
    @paths
  end

 private
  def count_visits(count_unique)
    count = 0
    @paths.each do |path, ip|
      ip.each do |ip_addr, visits|
 	count_unique == true ? count += 1 : count += visits 
      end
    end
    count
  end
end
