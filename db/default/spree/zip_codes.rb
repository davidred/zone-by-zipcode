ZIP_CODES = { 'Florida' => [ 33010, 33012, 33013, 33014, 33015, 33016, 33018, 33030, 33031, 33032, 33033, 33034, 33035, 33039, 33149, 33150,
  33101, 33142, 33143, 33144, 33145, 33146, 33147, 33155, 33156, 33157, 33158, 33122, 33125, 33126, 33127, 33128, 33129, 33130,
  33131, 33132, 33133, 33134, 33135, 33136, 33137, 33138, 33161, 33162, 33165, 33166, 33167, 33168, 33169, 33170, 33172, 33173,
  33174, 33175, 33176, 33177, 33178, 33179, 33180, 33181, 33182, 33183, 33184, 33185, 33186, 33187, 33189, 33190, 33193, 33194,
  33196, 33139, 33140, 33141, 33109, 33154, 33160, 33054, 33055, 33056 ]
}

ZIP_CODES.each do |state, zip_codes|
  state = Spree::State.where(name: state).first
  zip_codes.each do |zip_code|
    ZipCode.create!(state_id: state.id, value: zip_code.to_s)
  end
end
