class Predictor

  def initialize
    @name = nil
    @domain = nil
    @company_emails = {}
    @emails = Email.all_emails
    @pattern = Pattern.new
  end

  def get_name
    puts "Please enter the full name of the person you're searching:"
    @name = gets.chomp
  end

  def get_domain
    puts "Please enter the company domain where #{@name} works:"
    @domain = gets.chomp.downcase
  end

  def match?
    @emails.map do |name, email|
      return true if email.include?(@domain)
    end
    false
  end

  def no_match
    puts "Sorry, we can't accurately predict the email address for #{@name}."
  end

  def matching_emails
    @emails.map do |name, email|
      @company_emails[name.downcase] = email if email.include?(@domain)
    end
  end

  def num_of_company_emails
    matching_emails.size
  end

  def predict_email
    
  end

  def calculate_confidence
    
  end

  def construct_email
    
  end

  def predict
    get_name
    get_domain
    no_match if !match?
    matching_emails if match?
    puts @company_emails
  end
end