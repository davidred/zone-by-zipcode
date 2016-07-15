$ ->
  ($ '#country_based').click ->
    show_country()

  ($ '#state_based').click ->
    show_state()

  ($ '#zip_code_based').click ->
    show_zip_code()

  if ($ '#country_based').is(':checked')
    show_country()
  else if ($ '#state_based').is(':checked')
    show_state()
  else if ($ '#zip_code_based').is(':checked')
    show_zip_code()
  else
    show_state()
    ($ '#state_based').click()


show_country = ->
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#state_members').hide()

  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zip_code_members').hide()

  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zone_members').hide()

  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#country_members').show()

show_state = ->
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#country_members').hide()

  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zone_members').hide()

  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zip_code_members').hide()

  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#state_members').show()

show_zip_code = ->
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#country_members').hide()

  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#state_members').hide()

  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zone_members').hide()

  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#zip_code_members').show()
