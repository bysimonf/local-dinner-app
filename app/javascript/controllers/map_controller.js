import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
  }
    // console.log(this.markerValue);
    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        console.log(marker);
        new mapboxgl.Marker()
          .setLngLat([ marker.longitude, marker.latitude ])
          .addTo(this.map)
      })
    }
}
