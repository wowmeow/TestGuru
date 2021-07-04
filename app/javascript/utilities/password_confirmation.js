class PasswordConfirmation {
  constructor(password, passwordConfirmation) {
    this.password = password
    this.passwordConfirmation = passwordConfirmation
  }

  checkPasswordConfirmation() {
    if (this.passwordConfirmation && this.password) {
      (this.passwordConfirmation === this.password) ? this.showMatch() : this.showMismatch()
    } else {
      this.messageHide()
    }
  }

  messageHide = () => {
    const message = document.querySelector('.warning')
    message.classList.add('hidden')
  }

  showMatch = () => {
    const message = document.querySelector('.warning')
    message.textContent = 'Пароли совпадают'
    message.classList.remove('warning_mismatch')
    message.classList.add('warning_match')
    message.classList.remove('hidden')
  }

  showMismatch = () => {
    const message = document.querySelector('.warning')
    message.textContent = "Пароли не совпадают"
    message.classList.remove('warning_match')
    message.classList.add('warning_mismatch')
    message.classList.remove('hidden')
  }
}


