class PasswordConfirmation {
    constructor() {
        this.password = document.querySelector('#user_password')
        this.passwordConfirmation = document.querySelector('#user_password_confirmation')

        this.setup()
    }

    setup() {
        if (this.password.value !== '' && this.passwordConfirmation.value !== '') {
            this.password.addEventListener('input', this.checkPassword)
            this.passwordConfirmation.addEventListener('input', this.checkPasswordConfirmation)
        }
    }

    checkPassword() {
        const passwordConfirmation = document.querySelector('#user_password_confirmation')

        if (this.password && passwordConfirmation.value) {
            (this.password === passwordConfirmation.value) ? this.showMatch() : this.showMismatch()
        } else {
            this.messageHide()
        }
    }

    checkPasswordConfirmation() {
        const password = document.querySelector('#user_password')

        if (this.passwordConfirmation && password.value) {
            (this.passwordConfirmation === password.value) ? this.showMatch() : this.showMismatch()
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


