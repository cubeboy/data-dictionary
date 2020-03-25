<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <Category @getSelectedCategories='getSelectedCategories'/>
      <div class="row">
        <v-text-field v-model="params.searchVal" label="Search" outlined v-on:keyup.enter='submit()' ></v-text-field>
        <router-link :to=" '/term/' + params.searchVal"><v-chip class="ma-2">Search</v-chip></router-link>
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
      params: {}
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
    submit () {
      location.href = '/term/' + this.term
    },
    getSelectedCategories (selectedCategories) {
      this.params = selectedCategories
    }
  }
}
</script>
