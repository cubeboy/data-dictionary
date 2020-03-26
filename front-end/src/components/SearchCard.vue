<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <Category @getSelectedCategories='getSelectedCategories'/>
      <div class="row">
        <v-text-field v-model="params.searchVal" label="Search" outlined v-on:keyup.enter='submit()' ></v-text-field>
        <router-link :to=" '/term/' + params.searchVal"><v-chip class="ma-2">Search</v-chip></router-link>
      </div>
      <div>
        <v-data-table :headers="headers" :items="words" :items-per-page="5" class="elevation-1"></v-data-table>
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
      params: {},
      headers: [
        {
          text: '한글명',
          align: 'start',
          sortable: true,
          value: 'name'
        },
        { text: 'Eng', value: 'engName' },
        { text: 'short-Eng', value: 'shortEng' },
        { text: 'Entity', value: 'entity' },
        { text: 'Column', value: 'column' },
        { text: 'javascript', value: 'javascript' },
        { text: 'class', value: 'wordClass' },
        { text: 'class member', value: 'WordClassMember' },
        { text: 'param value', value: 'paramValue' }
      ]
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
