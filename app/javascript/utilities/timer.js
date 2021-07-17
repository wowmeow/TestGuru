export class Timer {
  constructor() {
    this.timer = document.querySelector('.timer')
    this.second_scount = Number(this.timer.dataset.secondsLeft)
    this.setTimer(timer, seconds_left)
  }

  setTimer(){
    const seconds_left = Number(this.timer.dataset.secondsLeft)
    this.drawTimer(seconds_left)
  }

  drawTimer(seconds){
    const minutes = Math.floor( seconds / 60)
    this.timer.innerHTML = ('0' + minutes).slice(-2) + ":" + ('0' + (seconds % 60)) .slice(-2)
  }

  getSecondsRemaining() {
    const current_timer = this.timer.innerHTML
    const minutes = Number(current_timer.slice(0, 2))
    const seconds = Number(current_timer.slice(-2))

    seconds += minutes * 60
  }

  initializeClock() {
    if (this.timer.innerHTML == "") {
      this.setTimer(this.timer)
    }
  }

  updateClock() {
    const total_seconds = getSecondsRemaining(timer);
    const fixedinterval = setInterval(updateClock, 1000);

    total_seconds -= 1

    this.drawTimer(timer, total_seconds)

    if (total_seconds == 0) {
      clearInterval(fixedinterval);
    }
  }
}
