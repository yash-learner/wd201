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
  dns_raw.reject do |x|
    (x[0].eql?("#")) || (x[0].eql?("\n"))
  end
    .map do |x|
    x.strip().split(", ")
  end
    .each_with_object({}) do |record, records|
    records[record[1]] = { type: record[0], target: record[2] }
  end
end

=begin

  The below function finds the ip address for corresponding domain name.
  if not found returns a corresponding message.

=end

def resolve(dns_records, lookup_chain, domain)
  record = dns_records[domain]
  if (!record)
    lookup_chain.pop()
    lookup_chain << "Error: record not found for " + domain
  elsif record[:type] == "CNAME"
    lookup_chain.append(record[:target])
    resolve(dns_records, lookup_chain, lookup_chain.last)
  elsif record[:type] == "A"
    lookup_chain.append(record[:target])
  else
    lookup_chain << "Invalid record type for " + domain
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.

dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
