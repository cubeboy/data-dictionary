<template>
<div>
    <div class="row" >

        <div style="text-align:center" id="filter">
            <h1>Search Filter</h1>
            <div class="row">
                <span v-for='(category, id) in categories' :key='id'>
                    <Category :category="category"/>
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
import Category from '@/components/Category.vue'
export default {
  data: function () {
    return {
      categories: []
    }
  },
  mounted () {
    this.categories = [
      { title: '대분류' },
      { title: '중분류' },
      { title: '소분류' }
    ]
  },
  components: {
    Category
  }
}
</script>
