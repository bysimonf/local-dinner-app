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
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl }))
  }
    // console.log(this.markerValue);
    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        console.log(marker);
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
        new mapboxgl.Marker()
          .setLngLat([ marker.longitude, marker.latitude ])
          .setPopup(popup)
          .addTo(this.map)
      })
    }

    #fitMapToMarkers() {
      console.log("check map fit");
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.longitude, marker.latitude ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
}
