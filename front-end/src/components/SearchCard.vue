<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <Category/>
      <div>
        <input v-model="word" placeholder="Search Here">
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
    }
  }
}
</script>
