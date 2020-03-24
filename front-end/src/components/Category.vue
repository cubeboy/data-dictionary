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
          @change="selectItem"
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
    parentItem: {}
  },
  data: () => ({
    selectedCategory: null,
    items: []
  }),
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
    selectItem () {
      this.$emit('conveySelectedItem')
      console.log('부모님, 받으십시오.')
    }
  }
}
</script>
