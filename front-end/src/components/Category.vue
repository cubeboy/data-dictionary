<template>
  <span>
      <div class="text-center">
        <table>
          <tr>
            <td v-for='(categories, index) in allCategories' :key="index">
              <v-combobox
              v-show='categories.isShow' v-model="categories.selectedCategory" :items="categories.categories"
              item-text="name" label="Choice Category"
              @change="selectItem(index, categories.selectedCategory)" return-object>
              </v-combobox>
            </td>
          </tr>
        </table>
      </div>
  </span>
</template>

<script>
import commonCodeService from '@/services/commonCodeService'

export default {
  data: () => ({
    root: { id: 0 },
    allCategories: [
      { categories: [], selectedCategory: null, isShow: true },
      { categories: [], selectedCategory: null, isShow: false },
      { categories: [], selectedCategory: null, isShow: false }
    ],
    searchParams: {
      category: {
        mainCategoryId: { operator: 'equalOrNull', value: null },
        middleCategoryId: { operator: 'equalOrNull', value: null },
        subCategoryId: { operator: 'equalOrNull', value: null }
      },
      searchVal: null
    }
  }),
  async mounted () {
    try {
      const respCommonCode = await commonCodeService.getCategories(this.root)
      this.allCategories[0].categories = respCommonCode.data
    } catch (error) {
      this.errored = true
    } finally {
      this.loading = false
    }
  },
  methods: {
    selectItem: async function (selectedAllCategoriesIndex, selectedCategory) {
      const mainIndex = 0
      const middleIndex = 1
      const subIndex = 2

      const respCommonCode = await commonCodeService.getCategories(selectedCategory)
      if (selectedAllCategoriesIndex === mainIndex) {
        this.allCategories[middleIndex].categories = respCommonCode.data

        this.allCategories[middleIndex].selectedCategory = null
        this.allCategories[middleIndex].isShow = true
        this.allCategories[subIndex].isShow = false

        this.searchParams.category.mainCategoryId.value = selectedCategory.id
      } else if (selectedAllCategoriesIndex === middleIndex) {
        this.allCategories[subIndex].categories = respCommonCode.data
        this.allCategories[subIndex].selectedCategory = null

        this.allCategories[subIndex].isShow = true

        this.searchParams.category.middleCategoryId.value = selectedCategory.id
      } else if (selectedAllCategoriesIndex === subIndex) {
        this.searchParams.category.subCategoryId.value = selectedCategory.id
      }

      if (this.allCategories[middleIndex].categories.length === 0) {
        this.allCategories[middleIndex].isShow = false
        this.allCategories[subIndex].isShow = false
      } else if (this.allCategories[subIndex].categories.length === 0) {
        this.allCategories[subIndex].isShow = false
      }

      this.getSelectedCategories()
    },
    getSelectedCategories () {
      this.$emit('getSelectedCategories', this.searchParams)
    }
  }
}
</script>
