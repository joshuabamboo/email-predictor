class Email
  @@all_emails = {
    "John Ferguson" => "john.ferguson@alphasights.com",
    "Damon Aw" => "damon.aw@alphasights.com",
    "Linda Li" => "linda.li@alphasights.com",
    "Larry Page" => "larry.p@google.com",
    "Sergey Brin" => "s.brin@google.com",
    "Steve Jobs" => "s.j@apple.com"
  }

  def self.all_emails
    @@all_emails
  end

  def first_name_dot_last_name(first_name, last_name, domain)
    puts "#{first_name}.#{last_name}@#{domain}"
  end

  def first_name_dot_last_initial(first_name, last_name, domain)
    puts "#{first_name}.#{last_name[0]}@#{domain}"
  end

  def first_initial_dot_last_name(first_name, last_name, domain)
    puts "#{first_name[0]}.#{last_name}@#{domain}"
  end

  def first_initial_dot_last_initial(first_name, last_name, domain)
    puts "#{first_name[0]}.#{last_name[0]}@#{domain}"
  end
end