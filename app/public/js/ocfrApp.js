var ocfrApp = new Vue ({
  el: '#ocfrPersonApp',
  data: {
    persons: []
  },

  methods: {
    fetchPeople() {
      fetch('dummy.php')
      .then(response => response.json())
      .then(json => { ocfrApp.persons = json })
    }
  },
  created(){
    this.fetchPeople();
  }
});
