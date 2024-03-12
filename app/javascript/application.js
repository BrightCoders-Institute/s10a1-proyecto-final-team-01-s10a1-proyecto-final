// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

import moment from 'moment'
window.moment = moment

import { DateRangePicker } from 'libraries/vanilla-datetimerange-picker'
window.DateRangePicker = DateRangePicker
