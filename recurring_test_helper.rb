def credit_card(number = '4242424242424242', options = {})
  defaults = {
    :number => number,
    :month => 9,
    :year => Time.now.year + 1,
    :first_name => 'Longbob',
    :last_name => 'Longsen',
    :verification_value => '123',
    :type => 'visa'
  }.update(options)

  Billing::CreditCard.new(defaults)
end

def check(options = {})
  defaults = {
    :name => 'Jim Smith',
    :routing_number => '244183602', 
    :account_number => '15378535', 
    :account_holder_type => 'personal', 
    :account_type => 'checking', 
    :number => '1'
  }.update(options)
  
  Billing::Check.new(defaults)
end

def address(options = {})
  { 
    :name     => 'Jim Smith',
    :address1 => '1234 My Street',
    :address2 => 'Apt 1',
    :company  => 'Widgets Inc',
    :city     => 'Ottawa',
    :state    => 'ON',
    :zip      => 'K1C2N6',
    :country  => 'CA',
    :phone    => '(555)555-5555',
    :fax      => '(555)555-6666'
  }.update(options)
end
