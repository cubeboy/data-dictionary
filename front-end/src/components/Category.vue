<template>
  <span>
    <div class="text-center">
      <v-col cols="8">
        <v-combobox
          v-model="select"
          :items="items"
          :label="typeName.name">
        </v-combobox>
      </v-col>
    </div>
  </span>
</template>

<script>
export default {
  props: {
    typeName: {},
    mainCategories: {}
  },
  data: () => ({
    select: [],
    items: []
  }),

  methods: {
    clickItem: function (name) {
      this.category.title = name
      // this.categoryPath.splice(index, 1, item)
    }
  },
  mounted () {
    if (this.typeName.name === '대분류') {
      this.items = this.mainCategories
      for (let index = 0; index < this.items.length; index++) {
        const category = this.items[index].name
        this.items[index] = category
      }
    }
  }
}
</script>
