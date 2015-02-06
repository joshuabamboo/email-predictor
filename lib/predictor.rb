class Predictor
  def initialize
    @first_name = nil
    @last_name = nil
    @domain = nil
    @company_emails = {}
    @emails = Email.all_emails
    @email = Email.new
    @pattern = Pattern.new
  end

  def get_name
    puts "Please enter the first name of the person you're searching:"
    @first_name = gets.chomp
    puts "Please enter the last name of the person you're searching:"
    @last_name = gets.chomp
  end

  def get_domain
    puts "Please enter the company domain where #{@first_name} works:"
    @domain = gets.chomp.downcase
  end

  def match?
    @emails.map do |name, email|
      return true if email.include?(@domain)
    end
    false
  end

  def no_match
    puts "Sorry, we can't accurately predict the email address for #{@first_name}."
  end

  def find_matching_emails
    @emails.map do |name, email|
      @company_emails[name.downcase] = email if email.include?(@domain)
    end
  end

  def construct_emails
    @email.first_name_dot_last_name(@first_name, @last_name, @domain) if @pattern.first_name_dot_last_name?(@company_emails)
    @email.first_name_dot_last_initial(@first_name, @last_name, @domain) if @pattern.first_name_dot_last_initial?(@company_emails)
    @email.first_initial_dot_last_name(@first_name, @last_name, @domain) if @pattern.first_initial_dot_last_name?(@company_emails)
    @email.first_initial_dot_last_initial(@first_name, @last_name, @domain) if @pattern.first_initial_dot_last_initial?(@company_emails)
  end

  # def num_of_company_emails
  #   matching_emails.size
  # end

  # def construct_email
    
  # end

  def predict
    get_name
    get_domain
    no_match if !match?
    if match?
      find_matching_emails
      construct_emails
    end
  end
end