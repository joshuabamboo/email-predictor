class Predictor
  def initialize
    @name = nil
    @domain = nil
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
    
  end

  def num_of_company_emails
    
  end

  def predict_email
    
  end

  def calculate_confidence
    
  end

  def construct_email
    
  end
end