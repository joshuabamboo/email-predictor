require 'spec_helper'

describe Pattern do
  let(:pattern) { Pattern.new }
  company_emails = {
    "john ferguson" => "john.ferguson@alphasights.com",
    "damon aw" => "damon.aw@alphasights.com",
    "linda li" => "linda.li@alphasights.com",
    "larry page" => "larry.p@google.com",
    "sergey brin" => "s.brin@google.com",
    "steve jobs" => "s.j@apple.com"
  }

  describe '#first_name_dot_last_name_count' do
    it 'returns number of pattern matches for first_name_dot_last_name' do
      expect(pattern.first_name_dot_last_name_count(company_emails)).to eql(3)
    end 
  end

  describe '#first_name_dot_last_initial_count' do
    it 'returns number of pattern matches for first_name_dot_last_name' do
      expect(pattern.first_name_dot_last_initial_count(company_emails)).to eql(1)
    end 
  end

  describe '#first_initial_dot_last_name_count' do
    it 'returns number of pattern matches for first_initial_dot_last_name' do
      expect(pattern.first_initial_dot_last_name_count(company_emails)).to eql(1)
    end 
  end

  describe '#first_initial_dot_last_initial_count' do
    it 'returns number of pattern matches for first_initial_dot_last_initial' do
      expect(pattern.first_initial_dot_last_initial_count(company_emails)).to eql(1)
    end
  end
end

