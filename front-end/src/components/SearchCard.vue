<template>
<div>
  <div>
    <div style="text-align:center" id="filter">
      <Category @getSelectedCategories='getSelectedCategories'/>
      <div class="row">
        <v-text-field v-model="searchParams.searchVal" label="Search" outlined v-on:keyup.enter='submit()' ></v-text-field>
        <v-chip class="ma-2" @click="submit()">Search</v-chip>
      </div>
      <div>
        <v-data-table
        show-expand :headers="headers" :items="termsInfo"
        :items-per-page="5" class="elevation-1"
        :single-expand="true" :expanded.sync="expanded">
          <template v-slot:expanded-item="{ headers, item }">
          <td :colspan="headers.length">{{ item.description }}</td>
          </template>
        </v-data-table>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import Category from '@/components/Category.vue'
import TermService from '@/services/termService'

export default {
  data: function () {
    return {
      searchParams: { category: {}, searchVal: '' },
      headers: [
        { text: '한글명', align: 'start', sortable: true, value: 'name' },
        { text: 'Eng', value: 'engName' },
        { text: 'short-Eng', value: 'shortEng' },
        { text: 'Entity', value: 'entity' },
        { text: 'Column', value: 'column' },
        { text: 'javascript', value: 'javascript' },
        { text: 'class', value: 'wordClass' },
        { text: 'class member', value: 'WordClassMember' },
        { text: 'param value', value: 'paramValue' }
      ],
      termsInfo: []
    }
  },
  components: {
    Category
  },
  methods: {
    async submit () {
      const respTermInfo = await TermService.getTermInfo(this.searchParams)
      this.termsInfo = respTermInfo.data
    },
    getSelectedCategories (selectedCategories) {
      this.searchParams = selectedCategories
    }
  }
}
</script>
