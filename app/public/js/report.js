var report1App = new Vue({
  el: '#report1',
  data: {
    reports: [],
    filter: {
      certType: ''
    }
  },
  methods: {
    fetchReport() {
      fetch('api/reports/report.php')
      .then(response => response.json())
      .then(json => { report1App.reports = json })
     }
    // formatLocalVisitDate(d) {
    //   return moment.utc(d).local().format("HH:mm MMM Do");
    // }
  },
  created() {
    this.fetchReport();
  }
});
