export class Timer {
  constructor() {
    this.timer = document.querySelector('.timer')
    this.seconds_left = Number(this.timer.dataset.secondsLeft)
    drawTimer(timer, seconds_left)
  }

  drawTimer(timer, seconds) {
    var minutes = Math.floor(seconds / 60)
    var seconds = seconds % 60
    timer.innerHTML = ('0' + minutes).slice(-2) + ":" + ('0' + seconds).slice(-2)
  }

  getSecondsRemaining(timer) {
    var current_timer = timer.innerHTML
    var minutes = Number(current_timer.slice(0, 2))
    var seconds = Number(current_timer.slice(-2))

    seconds += minutes * 60
  }

  initializeClock(timer) {
    if (timer.innerHTML == "") {
      setTimer(timer)
    }
  }

  updateClock() {
    var total_seconds = getSecondsRemaining(timer);
    var fixedinterval = setInterval(updateClock, 1000);

    total_seconds -= 1

    drawTimer(timer, total_seconds)

    if (total_seconds == 0) {
      clearInterval(fixedinterval);
    }
  }
}
