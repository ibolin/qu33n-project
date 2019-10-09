// var ocfrApp = new Vue ({
//   el: '#ocfrPersonApp',
//   data: {
//     persons: []
//     // recordPerson: {}
//   },
//
//   methods: {
//     fetchPeople() {
//       fetch('dummy.php')
//       .then(response => response.json())
//       .then(json => { ocfrApp.persons = json })
//     }
//     },
//   created(){
//     this.fetchPeople();
//   }
// });

var ocfrApp = new Vue({
  el: '#ocfrPersonApp',
  data: {
    persons: [],
    recordPerson: {}
  },
  methods: {
    fetchPeople() {
      fetch('api/records/')
      .then(response => response.json())
      .then(json => { ocfrApp.persons = json })
    },
    handleSubmit(event) {
      fetch('api/records/post.php', {
        method:'POST',
        body: JSON.stringify(this.recordPerson),
        headers: {
          "Content-Type": "application/json; charset=utf-8"
        }
      })
      .then( response => response.json() )
      .then( json => {ocfrApp.persons.push = json[0]})
      .catch( err=>{
        console.error('RECORD POST ERROR:');
        console.error(err);
      });
      this.persons.push( this.recordPerson );
      this.handleReset();
    },
    handleReset() {
      this.recordPerson = {
        firstName: '',
        lastName: '',
        position: '',
        station:'',
        gender:'',
        address: '',
        workPhone:'',
        mobilePhone:'',
        radioNumber:'',
        stationNumber:'',
        isActive: '',
        certification:''
      }
    },
    // handleRowClick(person) {
    //   patientTriageApp.patient = patient;
    // }
  }, // end methods
  created() {
    this.handleReset();
    this.fetchPeople();
  }
});
