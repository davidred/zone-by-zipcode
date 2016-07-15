module Spree
  class ZipCode < ActiveRecord::Base
    belongs_to :state, class_name: 'Spree::State'

    has_many :zone_members, 
      -> { where(zoneable_type: 'Spree::ZipCode') },
      class_name: 'Spree::ZoneMember',
      foreign_key: :zoneable_id

    has_many :zones, :through => :zone_members, class_name: 'Spree::Zone'

    validates :value, :state_id, presence: true
    # validate :postal_code_validate

    def to_s
      value
    end

    def name
      to_s
    end

    def state_name
      state.name
    end

    def postal_code_validate
      # find country for state
      return if state_id.blank?

      # ensure associated state exists
      if state_id.present?
        begin
          state = Spree::State.find(state_id)
        rescue ActiveRecord::RecordNotFound
          errors.add(:state_id, :invalid)
          return
        end
      end

      # ensure zip code is proper format for country
      country = state.country
      return unless TwitterCldr::Shared::PostalCodes.territories.include?(country.iso.downcase.to_sym)

      postal_code = TwitterCldr::Shared::PostalCodes.for_territory(country.iso)
      errors.add(:value, :invalid) unless postal_code.valid?(value.to_s.strip)
    end
  end
end