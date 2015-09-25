module Spree
  Zone.class_eval do
    has_many :zip_codes, through: :zone_members, source: :zoneable, source_type: "ZipCode"
  end
end