// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "../utilities/sorting_table"
import "../utilities/password_confirmation"
import "../utilities/form_inline"
import "../utilities/progress_bar"
import "../utilities/timer"

import { FormInline } from './utilities/form_inline.js'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load',  function () {
  // Sorting the test table
  const table_id = "test_table"

  // Password confirmation
  if (document.getElementById('registration_new')) {
    const passwordConfirmation = new PasswordConfirmation()
    passwordConfirmation.checkPasswordConfirmation
  }

  // Edit the test name
  const allSelectedTests = document.querySelectorAll('.form-inline-link')

  allSelectedTests.forEach(function (test) {
    new FormInline(test)
  })

  allSelectedTests.errorHandler

  // Progress bar on the test passage page
  if (document.querySelector(".progress-bar"))
    var deprecated = new ProgressBar()
      deprecated.changeValueOfProgress

  // Timer
  if (document.querySelector('.timer')){
    var timer = new Timer()
  }
})
