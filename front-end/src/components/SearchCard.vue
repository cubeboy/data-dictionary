<template>
<div>
    <div class="row" >
        <div id="search" style="margin-left:100px">
          <h1>Search Bar</h1>
          <div class="row">
          <input v-model="word" placeholder="Type in Here">
          <router-link :to=" '/search/' + word"><v-chip class="ma-2">Search</v-chip></router-link>
          </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
  data: function () {
    return {
      word: null
    }
  },
  mounted () {}
}
</script>
