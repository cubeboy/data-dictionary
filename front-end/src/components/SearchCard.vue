<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <h1>Search Filter</h1>
      <div class="row">
        <div v-for='(codeType, id) in codeTypes ' :key='id'>
          <Category :codeType='codeType' :selectedCategory1='selectedCategory' @ss='ss1'/>
          부모에서 준 값: {{selectedCategory.name}}
        </div>
      </div>
    </div>
  </div>

  <div>
    <div style="text-align:center" id="search">
      <h1>Search</h1>
        <input v-model="word" placeholder="Type in Here">
        <router-link :to=" '/search/' + word"><v-chip class="ma-2">Search</v-chip></router-link>
    </div>
  </div>
</div>
</template>

<script>
import Category from '@/components/Category.vue'

export default {
  data: function () {
    return {
      word: null,
      codeTypes: [
        { id: 1, name: '대분류' },
        { id: 2, name: '중분류' },
        { id: 3, name: '소분류' }
      ],
      selectedCategory: { // init for main categories
        codeTypeId: 0,
        id: 0
      }
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
    ss1: function (selectedCategory) {
      this.selectedCategory = selectedCategory
      alert('데이터 받음')
    }
  }
}
</script>
