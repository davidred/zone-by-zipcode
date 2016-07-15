Deface::Override.new(:virtual_path => 'spree/admin/zones/_form',
  :name => 'add_zip_codes_partial_to_zone_types',
  :insert_after => "erb[loud]:contains('country_members')",
  :text => "<%= render :partial => 'zip_code_members', :locals => { :zone_form => zone_form }%>"
)
