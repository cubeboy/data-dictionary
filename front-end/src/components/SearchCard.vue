<template>
<div>
    <div class="row" >

        <div style="text-align:center" id="filter">
            <h1>Search Filter</h1>
            <div class="row">
                <span v-for='(filter, id) in filters' :key='id'>
                    <searchFilter :filter="filter"/>
                </span>
            </div>
        </div>

        <div id="search" style="margin-left:100px">
          <h1>Search Bar</h1>
            <v-col cols="100" sm="20">
          <v-text-field
            label="Search Here"
            outlined
          ></v-text-field>
        </v-col>
        </div>
    </div>
</div>
</template>

<script>
import searchFilter from '@/components/SearchFilter.vue'
export default {
  data: function () {
    return {
      filters: [
        { title: '대분류' },
        { title: '중분류' },
        { title: '소분류' }
      ]
    }
  },
  mounte () {
    this.filters = [
      { title: '대분류' },
      { title: '중분류' },
      { title: '소분류' }
    ]
  },
  components: {
    searchFilter
  }
}
</script>
