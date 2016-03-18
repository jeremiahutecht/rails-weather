# Rails Weather
Just another weather app being used to build experience with UX and API's. Use this code at your own risk. No Seriously.

### What Am I Doing?
This code base is the "Quick and Dirty" implementation. Uses the Geocode gem. The gem itself is awesome, well tested and provides oodles of functionality. However, it doesn't exactly push the envelope on learning. This repo will be forked; the next version will use a PORO (plain old Ruby object) calling the Google GeoCode API. Then the app will be rewritten in AngularJS and if I am feeling particularly frisky in either GOLang or Phoenix.

## Dependencies
- [Foundation 6](https://github.com/zurb/foundation-rails)
- [Forecast.io API](https://developer.forecast.io/docs/v2)
- GeoCode Gem
- Ruby 2.3
- Rails 4.2

## Future
- Use Rails 5.0
- Rebuild App without a db
- Rebuild App to use a javascript call to Google GeoCode

## Process
- [x] Get bare bones site cobbled together
- [x] Verify Forecast.io API connectivity
- [x] Style Output to be less potato
  - [x] Mobile Styles
  - [x] Form Styles
  - [x] Structure CSS properly
- [x] Create Lookup Weather by Address

