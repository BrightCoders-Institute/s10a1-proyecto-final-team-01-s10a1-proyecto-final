import { Controller } from "@hotwired/stimulus"
import { Loader } from "@googlemaps/js-api-loader"

export default class extends Controller {
  static values = {
    apiKey: String
  }
  static targets = ["address", "latitude", "longitude", "component"];

  connect() {
    this.loader = new Loader({
      apiKey: this.apiKeyValue,
      version: "weekly",
    });

    this.loader.load().then(async () => {
      const { Places } = await google.maps.importLibrary("places");
      const { Map } = await google.maps.importLibrary("maps");
      const { Marker } = await google.maps.importLibrary("marker");
      const position = {lat: parseFloat(this.latitudeTarget.value || this.latitudeTarget.innerHTML), 
                        lng: parseFloat(this.longitudeTarget.value || this.longitudeTarget.innerHTML)};

      /*
      * Google Cloud Billing is currently deactivated.
      *
      * Load address autocompletion (this will be used only
      * if Google Cloud Billing is activated).
      */
      let autocomplete;
      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
          this.addressTarget,
          {
            types: ['address'],
            componentRestrictions: {'country': ['MX']},
            fields: ['place_id', 'geometry', 'name']
          }
        );

        autocomplete.addListener("place_changed", onPlaceChanged);
      }

      // Load Google Map.
      this.map = new Map(this.componentTarget, {
        center: position,
        zoom: 14,
      });
      
      this.marker = new google.maps.Marker({
        position: position,
        map: this.map,
        title: "Location",
      });

      // Add listeners in order to update marker's positions
      // when either the latitude or longitude change.
      const updateAddressOnMap = () => {
        position.lat = parseFloat(this.latitudeTarget.value || this.latitudeTarget.innerHTML);
        position.lng = parseFloat(this.longitudeTarget.value || this.longitudeTarget.innerHTML);

        this.map.setCenter(position);
        this.map.setZoom(14);
        this.marker.setPosition(position);
      }

      this.latitudeTarget.addEventListener('change', updateAddressOnMap);
      this.longitudeTarget.addEventListener('change', updateAddressOnMap);

      // This also will be used only if Google Cloud Billing is activated).
      function onPlaceChanged() {
        const place = autocomplete.getPlace();

        if (!place.geometry) {
          this.addressTarget.placeholder = "Enter a place";
          return;
        }
        this.addressTarget.innerHTML = place.name;

        if (place.geometry.viewport) {
          this.map.fitBounds(place.geometry.viewport);
        }
        else {
          this.map.setCenter(place.geometry.location);
          this.map.setZoom(14);
        }

        this.marker.setPosition(place.geometry.location);
        this.latitudeTarget.value = place.geometry.location.lat();
        this.longitudeTarget.value = place.geometry.location.lng();
      }
    });
  }
}
