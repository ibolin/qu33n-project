var certApp = new Vue({
  el: '#certificate',
  data: {
    certificates: [],
    recordCert: {},
    filter: {
      certType: ''
    }
  },
  methods: {
    fetchCert() {
      fetch('api/certs/cert.php')
      .then(response => response.json())
      .then(json => { certApp.certificates = json })
    },
    handleSubmit(event) {
      fetch('api/certs/post.php', {
        method:'POST',
        body: JSON.stringify(this.recordCert),
        headers: {
          "Content-Type": "application/json; charset=utf-8"
        }
      })
      .then( response => response.json() )
      .then( json => {certApp.certificates.push ( json[0])})
      .catch( err=>{
        console.error('RECORD POST ERROR:');
        console.error(err);
      });
      this.handleReset();
    },
    handleReset() {
      this.recordCert = {
        personId:'',
        certId: '',
        renewDate: '',
        expireDate: ''
        // certification:''
      }
    },
    // handleRowClick(person) {
    //   patientTriageApp.patient = patient;
    // }
  }, // end methods
  created() {
    this.handleReset();
    this.fetchCert();
  }
});
