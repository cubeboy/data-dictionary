<template>
<div>
    <div class="row" >
        <div style="text-align:center" id="filter">
            <h1>Search Filter</h1>
            <div class="row">
                <Category v-for='(category, idx) in categories ' :key='idx' :category='category'/>
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
      categories: []
    }
  },
  async mounted () {
    this.categories = [
      { title: '대분류', items: [] },
      { title: '중분류', items: [] },
      { title: '소분류', items: [] }
    ]

    try {
      const respCommonCodeType = await CategoryService.getCommonCodeType()
      this.categoryItems = respCommonCodeType.data
      this.categories[0].items = this.categoryItems
      console.log(this.categories[0].items)
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
  method: {
    selectCategory: function (categoryPath) {
      this.categoryPath.push(categoryPath)
    }
  },
  components: {
    Category
  }
}
</script>
