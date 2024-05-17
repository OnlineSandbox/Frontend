<template>
    <div class="hello">
        <div>
            Dank dir wurde die Website zum {{counter}}.ten mal neu geladen seit dem letzten DB Reset!
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    data() {
        return {
            counter: 0
        }
    },
    methods: {
        increaseCounter() {
            axios.post('http://20.52.160.67/api/counter')
                .then(response => {
                    this.counter = response.data.counterValue;
                })
                .catch(error => {
                    alert("Fehler: " + error);
                })
        }
    },
    created() {
        this.increaseCounter()
    }
}
</script>

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
