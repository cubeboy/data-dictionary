<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <h1>Search Filter</h1>
      <div class="row">
        <div v-for='(codeType, id) in codeTypes ' :key='id'>
          <Category :codeType='codeType' :parentItem='selectedCategory' @selctItem='conveySelectedItem'/>
        </div>
        <div>
          <!-- <h1>Search</h1>
          <input v-model="word" placeholder="Type in Here">
          <router-link :to=" '/common_code/' + word"><v-chip class="ma-2">Search</v-chip></router-link> -->
        </div>
      </div>
    </div>
  </div>
  <div>
    <div style="text-align:center" id="search">
      <h1>Search</h1>
      <input v-model="word" placeholder="Type in Here">
          <router-link :to=" '/common_code/' + word"><v-chip class="ma-2">Search</v-chip></router-link>
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
      selectedCategory: { id: 0 }
    }
  },
  components: {
    Category
  },
  methods: {
    conveySelectedItem: function () {
      alert('searchCard vue')
    }
  }
}
</script>
