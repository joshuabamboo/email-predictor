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

  def username
    
  end

  def domain
    
  end

  def first_name_dot_last_name(first_name, last_name)
    "#{first_name}.#{last_name}"
  end

  def first_name_dot_last_initial(first_name, last_name)
    "#{first_name}.#{last_name[0]}"
  end

  def first_initial_dot_last_name(first_name, last_name)
    "#{first_name[0]}.#{last_name}"
  end

  def first_initial_dot_last_initial(first_name, last_name)
    "#{first_name[0]}.#{last_name[0]}"
  end

  def build_email
    "#{username}@#{domain}"
  end
end