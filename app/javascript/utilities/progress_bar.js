export class ProgressBar {
  constructor() {
    this.progressBarData = document.querySelector(".progress-bar-data")
    this.currentQuestionsNumber = this.progressBarData.dataset.current_questions_number
    this.allQuestionsCount =  this.progressBarData.dataset.all_questions_count
  }

  changeValueOfProgress() {
    const completedQuestionsCount = this.currentQuestionsNumber - 1
    const progress = ( completedQuestionsCount / this.allQuestionsCount ) * 100

    this.progressBarData.textContent = progress + '%'
  }
}
