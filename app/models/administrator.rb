class Administrator < User

  validates_format_of :phone_number, :with => /\d{3}[ -]?\d{3}[ -]?\d{4}/, :message => 'Phone number must be in the format XXX-XXX-XXXX. Dashes/spaces optional'
end