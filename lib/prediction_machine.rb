class PredictionMachine
  attr_accessor :domain, :company_emails
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
    @emails.any? {|name, email| email.include?(@domain)}
  end

  def no_match
    puts "Sorry, we can not accurately predict the email addresses at #{@domain} at this time. Try another company."
    play_again
  end

  def find_matching_emails
    @emails.map {|name, email| @company_emails[name.downcase] = email if email.include?(@domain)}
    @company_emails
  end

  def matching_emails_count(company_emails)
    company_emails.length
  end

  def calculate_pattern_percentage(pattern_count, company_email_count)
    "#{((pattern_count.to_f/company_email_count)*100).round(1)}%"
  end

  def construct_emails
    puts "#{calculate_pattern_percentage(@pattern.first_name_dot_last_name_count(@company_emails), company_email_count)} of the emails in our system suggest the correct email is #{@email.first_name_dot_last_name(@first_name, @last_name, @domain)}" if @pattern.first_name_dot_last_name?(@company_emails)
    puts "#{calculate_pattern_percentage(@pattern.first_name_dot_last_initial_count(@company_emails), company_email_count)} of the emails in our system suggest the correct email is #{@email.first_name_dot_last_initial(@first_name, @last_name, @domain)}" if @pattern.first_name_dot_last_initial?(@company_emails)
    puts "#{calculate_pattern_percentage(@pattern.first_initial_dot_last_name_count(@company_emails), company_email_count)} of the emails in our system suggest the correct email is #{@email.first_initial_dot_last_name(@first_name, @last_name, @domain)}" if @pattern.first_initial_dot_last_name?(@company_emails)
    puts "#{calculate_pattern_percentage(@pattern.first_initial_dot_last_initial_count(@company_emails), company_email_count)} of the emails in our system suggest the correct email is #{@email.first_initial_dot_last_initial(@first_name, @last_name, @domain)}" if @pattern.first_initial_dot_last_initial?(@company_emails)
  end

  def company_email_count
    @company_emails.size
  end

  def message
    puts "We have #{company_email_count} email(s) from people that work at #{@domain}. Based off those patterns, here are our predictions for #{@first_name}'s email: "
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