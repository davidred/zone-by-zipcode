module Spree
  Zone.class_eval do
    has_many :zip_codes, through: :zone_members, source: :zoneable, source_type: "Spree::ZipCode"

    def zip_code_ids
      if kind == 'zip_code'
        members.pluck(:zoneable_id)
      else
        []
      end
    end

    def zip_code_ids=(ids)
      set_zone_members(ids, 'Spree::ZipCode')
    end

    def zip_code?
      kind == 'zip_code'
    end
  end
end
