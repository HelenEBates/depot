class SupportMailbox < ApplicationMailbox
  def process
    puts "START SupportMailbox#process:"
    puts "From  : #{mail.from_address}"
    puts "Subject : #{mail.subject}"
    puts "body  : #{mail.body}"
    puts "END Suppress#process"
  end
end
