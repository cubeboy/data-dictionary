<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <Category/>
      <div class="row">
        <v-text-field v-model="word" label="Search" outlined v-on:keyup.enter='submit()'></v-text-field>
        <router-link :to=" '/common_code/' + word"><v-chip class="ma-2">Search</v-chip></router-link>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import Category from '@/components/Category.vue'

export default {
  data: function () {
    return {
      word: null
    }
  },
  async mounted () {
    try {
    } catch (error) {
      this.errored = true
    } finally {
      this.loading = false
    }
  },
  components: {
    Category
  },
  methods: {
    conveySelectedItem (selectedItem) {
      console.log('parent>')
    },
    submit () {
      location.href = 'common_code/' + this.word
    }
  }
}
</script>
