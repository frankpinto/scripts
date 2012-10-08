consts = ActiveMerchant.constants
looking_for = consts.select do |c_string|
  c = ActiveMerchant.const_get(c_string)
  if (c.class == Module || c.class == Class) && c.method_defined?(:ssl_post)
    true
  end
end
