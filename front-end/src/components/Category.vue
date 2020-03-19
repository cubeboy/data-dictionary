<template>
    <span>
         <div class="text-center">
    <v-menu offset-y>
      <template v-slot:activator="{ on }">
        <v-btn color="primary" dark v-on="on">
         {{category.title}}
        </v-btn>
      </template>
      <v-list>
        <v-list-item v-for="(categoryItem, index) in category.items" :key="index">
          <v-list-item-title @click="clickItem(categoryItem.name)" @select-category='setCategoryPath'>{{ categoryItem.name }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
 </span>
</template>

<script>
export default {
  props: {
    category: {},
    // categoryItems: {},
    categoryPath: {}
  },
  data: () => ({}),

  methods: {
    clickItem: function (name) {
      this.category.title = name
      // this.categoryPath.splice(index, 1, item)
    },
    setCategoryPath: function () {

    }
  },
  mounted () {
  }
}
</script>
