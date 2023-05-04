<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
      <div id="test">
        <button @click="sendData">Daten senden</button>
      </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
    methods: {
        sendData() {
            axios.post('http://localhost:8081/api/test', {
                data: {
                    // Hier können Sie die Daten einfügen, die an das Backend gesendet werden sollen
                }
            }).then(response => {
                alert("Glückwunsch: " + response);
            }).catch(error => {
                alert("Fehler: " + error);
                alert("try 8080: ");
                axios.post('http://localhost/api/test', {
                    data: {
                        // Hier können Sie die Daten einfügen, die an das Backend gesendet werden sollen
                    }
                }).then(response => {
                    alert("Glückwunsch: " + response);
                }).catch(error => {
                    alert("Fehler: " + error);
                })
            })
        },
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
