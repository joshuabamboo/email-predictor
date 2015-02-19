require 'spec_helper'

describe PredictionMachine do
  let(:prediction_machine) { PredictionMachine.new }

  describe '#find_matching_emails' do 
    it 'returns corresponding emails for a domain' do 
      prediction_machine.domain = "alphasights.com"

      expect(prediction_machine.find_matching_emails).to eql({
        "john ferguson" => "john.ferguson@alphasights.com",
        "damon aw" => "damon.aw@alphasights.com",
        "linda li" => "linda.li@alphasights.com"
      })
    end
  end

  describe '#company_email_count' do
    it 'returns number of emails in our database that match a company domain' do
      prediction_machine.company_emails = {
        "john ferguson" => "john.ferguson@alphasights.com",
        "damon aw" => "damon.aw@alphasights.com",
        "linda li" => "linda.li@alphasights.com"
      }
      
      expect(prediction_machine.company_email_count).to eql(3)
    end
  end

  describe '#calculate_pattern_percentage' do
    it 'returns a value representing the percentage of company specific emails that match a pattern' do
      company_email_count = 3
      first_name_dot_last_name_count = 3

      expect(prediction_machine.calculate_pattern_percentage(first_name_dot_last_name_count, company_email_count)).to eql("100.0%")
    end
  end
end