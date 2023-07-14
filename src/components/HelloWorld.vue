<template>
    <div class="hello">
        <div id="test">
            <button id="counter-button" @click="increaseCounter()">Counter up</button>
        </div>
        <div v-if="counter!=0">
            DU HAST DEN {{ counter }}.TEN KLICK GEMACHT SEIT DEM LETZTEN NEUSTART. GRATULATION!
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
            axios.post('http://sandbox-online.westeurope.cloudapp.azure.com/api/counter')
                .then(response => {
                    this.counter = response.data.counterValue;
                    console.log(response);
                })
                .catch(error => {
                    alert("Fehler: " + error);
                })
        }
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
