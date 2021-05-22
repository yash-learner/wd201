days_until_expiration = 5
          multiple = <<-STRING
          Subscription expiring soon!
          Your free trial will expire in #{days_until_expiration} days.
          Please update your billing information.
          STRING

          multiple1 =     <<~HEREDOC
          Subscription expiring soon!
          Your free trial will expire in #{days_until_expiration} days.
          Please update your billing information.
          HEREDOC

puts multiple #outputs string with indendation| HEREDOC
puts
puts multiple1 # outputs  string without indendation | squiggly HEREDOC


# https://infinum.com/the-capsized-eight/multiline-strings-ruby-2-3-0-the-squiggly-heredoc
