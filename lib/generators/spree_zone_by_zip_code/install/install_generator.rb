module SpreeZoneByZipCode
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false
      class_option :auto_run_seed_data, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_zone_by_zip_code\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_zone_by_zip_code\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_zone_by_zip_code\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_zone_by_zip_code\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_zone_by_zip_code'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end

      def add_seed_data
        add_seed_data = options[:add_seed_data] || ['', 'y', 'Y'].include?(ask 'Would you like to add sample zip codes to you seeds.rb file?')
        if add_seed_data
          append_file 'db/seeds.rb', <<-RUBY

### This code was added by the spree_zone_by_zip_code extension

# Add list of state zip codes where you will be providing service. Default list includes all Miami Dade zip codes.
ZIP_CODES = { 'Florida' => [33002, 33009, 33010, 33011, 33012, 33013, 33014, 33015, 33016, 33017, 33018, 33030, 33031,
  33032, 33033, 33034, 33035, 33039, 33054, 33055, 33056, 33090, 33092, 33101, 33102, 33107, 33109, 33110, 33111,
  33112, 33114, 33116, 33119, 33121, 33122, 33124, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133,
  33134, 33135, 33136, 33137, 33138, 33139, 33140, 33141, 33142, 33143, 33144, 33145, 33146, 33147, 33148, 33149,
  33150, 33151, 33152, 33153, 33154, 33155, 33156, 33157, 33158, 33159, 33160, 33161, 33162, 33163, 33164, 33165,
  33166, 33167, 33168, 33169, 33170, 33172, 33173, 33174, 33175, 33176, 33177, 33178, 33179, 33180, 33181, 33182,
  33183, 33184, 33185, 33186, 33187, 33188, 33189, 33190, 33193, 33194, 33195, 33196, 33197, 33199, 33231, 33233,
  33234, 33238, 33239, 33242, 33243, 33245, 33247, 33255, 33256, 33257, 33261, 33265, 33266, 33269, 33280, 33283,
  33296, 33299]
}

# Add list of zip codes that will be serviced by sample zone
SERVICE_ZIP_CODES = [33128, 33139, 33140, 33141, 33160, 33009, 33010, 33011, 33129, 33154, 33180]

# Only create run if the zone has not yet been created
if Spree::Zone.where(name: 'Zip Codes', description: 'Valid zip codes').empty?
  # Create sample zip codes
  ZIP_CODES.each do |state, zip_codes|
    state = Spree::State.where(name: state).first
    zip_codes.each do |zip_code|
      Spree::ZipCode.create!(state_id: state.id, value: zip_code.to_s)
    end
  end

  # Create sample zone
  zone = Spree::Zone.create(name: "Zip Codes", description: "Valid zip codes")

  # Populate sample zone with service zip codes
  SERVICE_ZIP_CODES.each do |zip_code|
    spree_zip_code = Spree::ZipCode.find_by_value(zip_code.to_s)
    zone.zone_members.create!(zoneable_id: spree_zip_code.id, zoneable_type: "Spree::ZipCode")
  end
end
          RUBY
        else
          puts 'Skipping adding seed data'
        end
      end

      def run_seeds
        populate_sample_data = options[:auto_run_seed_data] || ['', 'y', 'Y'].include?(ask 'Would you like to run seeds.rb?')
        if populate_sample_data
          run 'bundle exec rake db:seed'
        else
          puts 'Skipping rake db:seed.'
        end
      end
    end
  end
end
