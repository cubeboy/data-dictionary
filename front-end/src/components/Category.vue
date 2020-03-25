<template>
  <span>
      <div class="text-center">
        <table>
          <tr>
            <td v-for='(categories, index) in allCategories' :key="index">
              <v-combobox style="width:150px"
              v-show='showCategories[index]' v-model="categories.selectedCategory" :items="categories.categories"
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
      { selectedCategory: null, categories: [] },
      { selectedCategory: null, categories: [] },
      { selectedCategory: null, categories: [] }
    ],
    showCategories: [
      true, false, false
    ],
    params: {
      category: {
        mainCategoryId: {
          operateor: 'equalOrNull',
          value: null
        },
        middleCategoryId: {
          operateor: 'equalOrNull',
          value: null
        },
        subCategoryId: {
          operateor: 'equalOrNull',
          value: null
        }
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

      if (selectedAllCategoriesIndex === mainIndex) {
        this.allCategories[middleIndex].selectedCategory = null
        const respCommonCode = await commonCodeService.getCategories(selectedCategory)
        this.allCategories[middleIndex].categories = respCommonCode.data
        this.showCategories[middleIndex] = true
        this.showCategories[subIndex] = false

        this.params.category.mainCategoryId.value = selectedCategory.id
      } else if (selectedAllCategoriesIndex === middleIndex) {
        this.allCategories[subIndex].selectedCategory = null
        const respCommonCode = await commonCodeService.getCategories(selectedCategory)
        this.allCategories[subIndex].categories = respCommonCode.data
        this.showCategories[subIndex] = true

        this.params.category.middleCategoryId.value = selectedCategory.id
      } else if (selectedAllCategoriesIndex === subIndex) {
        this.params.category.subCategoryId.value = selectedCategory.id
      }

      if (this.allCategories[middleIndex].categories.length === 0) {
        this.showCategories[middleIndex] = false
        this.showCategories[subIndex] = false
      } else if (this.allCategories[subIndex].categories.length === 0) {
        this.showCategories[subIndex] = false
      }

      this.getSelectedCategories()
    },
    getSelectedCategories () {
      this.$emit('getSelectedCategories', this.params)
    }
  }
}
</script>
