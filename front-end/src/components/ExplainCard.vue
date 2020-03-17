<template>
<div>
  <h1>상세설명</h1>

  <h2>{{word.word}}</h2>
  <div id="variables">
    <v-chip v-for='(variable, id) in word.variables' :key='id' class="ma-2">
      <router-link :to="'/'+variable"><v-list-item-subtitle>{{variable}}</v-list-item-subtitle></router-link>
    </v-chip>
  </div>
  <br>
  <p>{{word.meaning}}</p>
</div>
</template>

<script>
export default {
  data: () => ({
  }),
  props: {
    word: {}
  },
  mounte () {
    this.words = [
      { word: '단어' },
      { meaning: '뜻' },
      { variables: [] }
    ]
  }
}
</script>
