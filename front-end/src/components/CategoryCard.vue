<template>
<div>
    <div class="row" >
        <div style="text-align:center" id="filter">
            <h1>Search Filter</h1>
            <div class="row">
              <Category v-for='(typeName, id) in typeNames ' :key='id' :typeName='typeName' :mainCategories='mainCategories'/>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import Category from '@/components/Category.vue'
import CategoryService from '../../services/categoryService'
export default {
  data: function () {
    return {
      word: null,
      typeNames: [],
      mainCategories: []
    }
  },
  async mounted () {
    try {
      const respCommonCodeType = await CategoryService.getCommonCodeType()
      this.typeNames = respCommonCodeType.data[0]
      this.mainCategories = respCommonCodeType.data[1]
      console.log(this.typeNames)
      console.log(this.mainCategories[0].name)
    } catch (error) {
      this.errored = true
    } finally {
      this.loading = false
    }

    // CategoryService.getCommonCodeType()
    //   .then(data => {
    //     this.categoryItems = data
    //     // console.log(data)
    //   })
    //   .catch(error => {
    //     this.errored = true
    //     console.log(error.message)
    //   })
    //   .finally(() => {
    //     this.loading = false
    //   })
  },
  // method: {
  //   selectCategory: function (categoryPath) {
  //     this.categoryPath.push(categoryPath)
  //   }
  // },
  components: {
    Category
  }
}
</script>
