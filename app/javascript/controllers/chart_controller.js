import { Controller } from "@hotwired/stimulus"
// import { Chart, registerables } from 'chart.js';
import Chart from 'chart.js/auto';
// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["canvas"]
  static values = {data: String}

  connect() {
      // console.log(JSON.parse(this.dataValue))
      const myChart = new Chart(this.canvasTarget, {
      type: 'bar', data: JSON.parse(this.dataValue)
      // data: {
      //     labels: ['Pending', 'Applied', 'Interviews', 'Rejected', 'Offers'],
      //     datasets: [{
      //         label: '# of Activities',
      //         data: [0, 1, 2, 3, 4],
      //         backgroundColor: [
      //             'rgba(211, 243, 238, 0.3)',
      //             'rgba(104, 225, 253, 0.2)',
      //             'rgba(250, 250, 55, 0.2)',
      //             'rgba(250, 128, 114, 0.2)',
      //             'rgba(124, 252, 0, 0.2)'
      //         ],
      //         borderColor: [
      //             'rgba(211, 243, 238, 1)',
      //             'rgba(104, 225, 253, 1)',
      //             'rgba(250, 250, 55, 1)',
      //             'rgba(250, 128, 114, 1)',
      //             'rgba(124, 252, 0, 1)'
      //         ],
      //         borderWidth: 1
      //     }]
      // },
      // options: {
      //     scales: {
      //         y: {
      //             beginAtZero: true
      //         }
      //     }
      // }
  });
  }
}
