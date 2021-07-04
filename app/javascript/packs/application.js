// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import("../utilities/sorting_table")
import("../utilities/password_confirmation")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// sorting the test table
document.addEventListener('turbolinks:load',  () => {
    const table_id = "test_table"
})

// password confirmation
document.addEventListener('turbolinks:load', () => {
    // const registration = document.getElementById('registration_new')
    const password = document.querySelector('#user_password')
    const passwordConfirmation = document.querySelector('#user_password_confirmation')

    if ((document.getElementById('registration_new')) && (password.value !== '' && passwordConfirmation.value !== '')) {
        new PasswordConfirmation(password, passwordConfirmation)

        this.passwordConfirmation.addEventListener('input', this.checkPasswordConfirmation)
    }
})
