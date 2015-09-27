Deface::Override.new(:virtual_path => 'spree/admin/zones/_form',
	:name => 'add_zip_codes_radio_to_zone_types',
	:insert_bottom => 'div.form-group',
	:text => "
  <div class='radio'>
            <%= label_tag :zip_code_based do %>
              <%= zone_form.radio_button('kind', 'zip_code', { :id => 'zip_code_based' }) %>
              <%= Spree.t(:zip_code_based) %>
            <% end %>
          </div>")

Deface::Override.new(:virtual_path => 'spree/admin/zones/_form',
	:name => 'add_zip_codes_partial_to_zone_types',
	:insert_bottom => 'div.col-md-6',
	:text => "<%= render :partial => 'state_members', :locals => { :zone_form => zone_form }%>"
	)