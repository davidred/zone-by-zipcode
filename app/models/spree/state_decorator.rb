module Spree
  State.class_eval do
    has_many :zip_codes, class_name: 'Spree::ZipCode'
  end
end
