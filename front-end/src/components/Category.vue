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
      {{selectedCategory1}}
    </div>
  </span>
</template>

<script>
import commonCodeService from '../../services/commonCodeService'

export default {
  props: {
    codeType: {},
    selectedCategory1: {} // 초기 codeTypeId:0, parentId:0
  },
  data: () => ({
    selectedCategory: null,
    items: []
  }),
  watch: {
    selectedCategory: function () {
      this.ss()
    }
  },
  async mounted () {
    try {
      if ((this.selectedCategory1.codeTypeId + 1) === this.codeType.id) {
        this.selectedCategory1.codeTypeId += 1
        const respCommonCode = await commonCodeService.getCategories(this.selectedCategory1)
        this.items = respCommonCode.data
      }
    } catch (error) {
      this.errored = true
    } finally {
      this.loading = false
    }
  },
  methods: {
    ss: function () {
      this.$emit('ss', this.selectedCategory)
      alert(this.codeType.id + '데이터 전달')
    }
  }
}
</script>
