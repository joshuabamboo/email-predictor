class PredictionMachine
  def initialize
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
    @emails.map {|name, email| return true if email.include?(@domain)}
    false
  end

  def no_match
    puts "Sorry, we can not accurately predict the email addresses at #{@domain} at this time. Try another company."
    play_again
  end

  def find_matching_emails
    @emails.map {|name, email| @company_emails[name.downcase] = email if email.include?(@domain)}
  end

  def construct_emails
    @email.first_name_dot_last_name(@first_name, @last_name, @domain) if @pattern.first_name_dot_last_name?(@company_emails)
    @email.first_name_dot_last_initial(@first_name, @last_name, @domain) if @pattern.first_name_dot_last_initial?(@company_emails)
    @email.first_initial_dot_last_name(@first_name, @last_name, @domain) if @pattern.first_initial_dot_last_name?(@company_emails)
    @email.first_initial_dot_last_initial(@first_name, @last_name, @domain) if @pattern.first_initial_dot_last_initial?(@company_emails)
  end

  def num_of_company_emails
    @company_emails.size
  end

  def message
    puts "We have #{num_of_company_emails} email(s) from people that work at #{@domain}. Based off those patterns, we predict that #{@first_name}'s email is: "
  end

  def play_again
    puts "Would you like to search again? (Y/n)"
    choice = gets.chomp.downcase
    PredictionMachine.new.predict if choice == "y"
    abort("Thanks for using The Prediction Machine. Goodbye.") if choice == "n"
  end

  def predict
    get_name
    get_domain
    no_match if !match?
    find_matching_emails
    message
    construct_emails
    play_again
  end
end