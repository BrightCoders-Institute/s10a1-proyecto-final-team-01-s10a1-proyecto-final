# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from 'app/javascript/libraries', under: 'libraries'
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@googlemaps/js-api-loader", to: "@googlemaps--js-api-loader.js" # @1.16.6
pin 'moment' # @2.30.1
pin "tom-select" # @2.3.1
pin "@spreadtheweb/multi-range-slider", to: "@spreadtheweb--multi-range-slider.js" # @1.0.2
