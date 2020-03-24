<template>
  <span>
    <div class="text-center">
      <v-col cols="8">
        <v-combobox
          v-model="selectedCategory"
          :items="items"
          item-text="name"
          item-value="id"
          :label="codeType.name"
          return-object
          >
        </v-combobox>
      </v-col>
    </div>
  </span>
</template>

<script>
import commonCodeService from '../../services/commonCodeService'

export default {
  props: {
    codeType: {},
    parentItem: {} // 초기 codeTypeId:0, parentId:0
  },
  data: () => ({
    selectedCategory: null,
    items: []
  }),
  watch: {
    selectedCategory: function () {
      this.selectItem()
    }
  },
  async mounted () {
    try {
      if (this.codeType.id === 1) {
        const respCommonCode = await commonCodeService.getCategories(this.parentItem)
        this.items = respCommonCode.data
      }
    } catch (error) {
      this.errored = true
    } finally {
      this.loading = false
    }
  },
  methods: {
    selectItem: function () {
      this.$emit('conveySelectedItem', this.selectedCategory)
      alert('데이터 전달')
    }
  }
}
</script>
