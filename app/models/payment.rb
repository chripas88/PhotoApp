class Payment < ApplicationRecord
  # they will not be stored in the DB
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user
  
  def self.month_options
    
    # set display format
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
    
  end
  
  def self.year_options
    
    # year from today till +10 years
    (Date.today.year..(Date.today.year+10)).to_a
    
  end
  
  def process_payment
    
    customer = Stripe::Customer.create email: email, card: token
    Stripe::Charge.create customer: customer.id, amount: 1000, description: 'Premium', currency: 'usd'
    
  end
  
end
