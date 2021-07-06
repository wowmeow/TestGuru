export class PasswordConfirmation {
  constructor() {
    this.password = document.querySelector('#user_password')
    this.passwordConfirmation = document.querySelector('#user_password_confirmation')
  }

  checkPasswordConfirmation() {
    if ((this.passwordConfirmation && this.password) && (password.value !== '' && passwordConfirmation.value !== '')) {
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


