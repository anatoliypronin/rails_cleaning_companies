import React from "react"
import { YMaps, Placemark, Map, ZoomControl } from 'react-yandex-maps';
class CityMap extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cities_geometry: [],
      width: '100%',
      height: 300,
    }
  };

  fetchCities() {
    fetch('/api/v1/city')
      .then(response => response.json())
      .then(cities => cities.map(city => (
        fetch(`https://api.opencagedata.com/geocode/v1/json?q=${city.name}&key=8a6b7d0425f84ea8b2d6de8c898ffe2a&pretty=1&no_dedupe=1&no_annotations=1&limit=1&countrycode=ru&language=ru`)
          .then(response => response.json())
          .then(result => this.setState({
            cities_geometry: [...this.state.cities_geometry, result.results[0].geometry]
        }))
      )))
  };

  componentDidMount() {
    this.fetchCities();
  };

  render(){
    const {width, height} = this.state
    return (
      <YMaps>
        <Map
          width={width}
          height={height}
          defaultState={{
            center: [61.751574, 81.573856],
            zoom: 3,
            controls: [],

          }}
        >
          {
            this.state.cities_geometry.map(geometry => (
              <Placemark geometry={[geometry.lat, geometry.lng]} />
            ))
          }
          <ZoomControl options={{ float: 'right' }} />

        </Map>
      </YMaps>
    );
  }
}

export default CityMap
