class Pattern
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
    company_emails.any? {|name, email| "#{first_name(name)}.#{last_name(name)}" == username(email)}
  end

  def first_name_dot_last_initial?(company_emails)
    company_emails.any? {|name, email| "#{first_name(name)}.#{last_initial(name)}" == username(email)}
  end

  def first_initial_dot_last_name?(company_emails)
    company_emails.any? {|name, email| "#{first_initial(name)}.#{last_name(name)}" == username(email)}
  end

  def first_initial_dot_last_initial?(company_emails)
    company_emails.any? {|name, email| "#{first_initial(name)}.#{last_initial(name)}" == username(email)}
  end

  def first_name_dot_last_name_count(company_emails)
    count = 0
    company_emails.each do |name, email| 
      if "#{first_name(name)}.#{last_name(name)}" == username(email)
        count += 1
      end
    end
    count
  end

  def first_name_dot_last_initial_count(company_emails)
    count = 0
    company_emails.each do |name, email| 
      if "#{first_name(name)}.#{last_initial(name)}" == username(email)
        count += 1
      end
    end
    count
  end

  
  def first_initial_dot_last_name_count(company_emails)
    count = 0
    company_emails.each do |name, email| 
      if "#{first_initial(name)}.#{last_name(name)}" == username(email)
        count += 1
      end
    end
    count
  end

  def first_initial_dot_last_initial_count(company_emails)
    count = 0
    company_emails.each do |name, email| 
      if "#{first_initial(name)}.#{last_initial(name)}" == username(email)
        count += 1
      end
    end
    count
  end

end