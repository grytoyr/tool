require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'
import 'flatpickr/dist/flatpickr.css';

import { initMapbox } from '../plugins/init_mapbox';
import { toggleDateInputs } from '../plugins/init_flatpickr';

initMapbox();
toggleDateInputs();
