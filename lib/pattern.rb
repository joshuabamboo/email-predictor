class Pattern
  def initialize
    @emails = Email.all_emails
  end

  def first_name(name)
    name.split.first
  end

  def last_name(name)
    name.split.last    
  end

  def first_initial(name)
    name.split.first.split("").first
  end

  def last_initial(name)
    name.split.last.split("").first
  end

  def username(email)
    email.match(/(.*)@/)[1]
  end

  def first_name_dot_last_name?(company_emails)
    company_emails.map do |name, email|
      return true if "#{first_name(name)}.#{last_name(name)}" == username(email)
    end
  end

  def first_name_dot_last_initial?(company_emails)
    company_emails.map do |name, email|
      return true if "#{first_name(name)}.#{last_initial(name)}" == username(email)
    end
  end

  def first_initial_dot_last_name?(company_emails)
    company_emails.map do |name, email|
      return true if "#{first_initial(name)}.#{last_name(name)}" == username(email)
    end
  end

  def first_initial_dot_last_initial?(company_emails)
    company_emails.map do |name, email|
      return true if "#{first_initial(name)}.#{last_initial(name)}" == username(email)
    end
  end

  def find_pattern
    
  end

end

# @@all_emails = {
#     "John Ferguson" => "john.ferguson@alphasights.com",
#     "Damon Aw" => "damon.aw@alphasights.com",
#     "Linda Li" => "linda.li@alphasights.com",
#     "Larry Page" => "larry.p@google.com",
#     "Sergey Brin" => "s.brin@google.com",
#     "Steve Jobs" => "s.j@apple.com"
#   }

#compare name to username


#build_email(name, domain) #=> jo.john@alphasights.com