def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

=begin

  parse_dns function filters the comment and empty spaces
  from dns_raw and splits each line into three columns.
  then a hash is created for each record in dns_raw

=end

def parse_dns(dns_raw)

  dns_raw = dns_raw.reject do |x|
    (x[0].eql?("#") == true) ||  (x[0].eql?("\n") == true)
  end

  dns_raw = dns_raw.map do |x|
    x.split(", ")
  end

  dns_records = {}
  dns_raw.each do |x|
    dns_records[x[1]] = x[2]
  end

  dns_records
end

=begin

  The below function finds the ip address for corresponding domain name.
  if not found returns a corresponding message.

=end

def resolve(dns_records, lookup_chain, domain)

  if dns_records[domain] == nil
    lookup_chain.pop()
    return lookup_chain.append("Error: record not found for #{domain}")
  end


  length_of_ip = dns_records[domain].length
  if dns_records[domain][length_of_ip-2].match?(/[[:digit:]]/)
    lookup_chain.append(dns_records[domain])
    return lookup_chain

  else
    lookup_chain.append(dns_records[domain].strip())
    return resolve(dns_records, lookup_chain, lookup_chain.last)
  end

end


# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.

dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
