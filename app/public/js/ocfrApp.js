var ocfrApp = new Vue({
  el: '#ocfrPersonApp',
  data: {
    persons: [],
    recordPerson: {},
    filter: {
      station: ''
    }
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
      .then( json => {ocfrApp.persons.push ( json[0])})
      .catch( err=>{
        console.error('RECORD POST ERROR:');
        console.error(err);
      });
      this.handleReset();
    },
    handleReset() {
      this.recordPerson = {
        personId:'',
        firstName: '',
        lastName: '',
        position: '',
        station:'',
        gender:'',
        address: '',
        workPhone:'',
        mobilePhone:'',
        radioNumber:'',
        isActive: ''
        // certification:''
      }
    },
    handleDelete(event) {
      fetch('api/records/delete.php', {
        method:'POST',
        body: JSON.stringify(this.persons),
        headers: {
          "Content-Type": "application/json; charset=utf-8"
        }
      })
    },
    // handleRowClick(person) {
    //   patientTriageApp.patient = patient;
    // }
  }, // end methods
  created() {
    this.handleReset();
    this.fetchPeople();
    this.handleDelete();
  }
});
