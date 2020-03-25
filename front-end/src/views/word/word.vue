<template>
  <v-app id="keep">
    <v-app-bar app clipped-left color="amber">
      <v-app-bar-nav-icon @click="drawer = !drawer"/>
      <span class="title ml-3 mr-5">단어</span>
      <v-text-field solo-inverted flat hide-details label="Search"/>
      <v-spacer />
    </v-app-bar>

    <v-navigation-drawer v-model="drawer" app clipped color="grey lighten-4">
      <v-list dense class="grey lighten-4">
        <template v-for="(item, i) in items">
          <v-row v-if="item.heading" :key="i" align="center">
            <v-col cols="6">
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-col>
            <v-col cols="6" class="text-right">
              <v-btn small text>edit</v-btn>
            </v-col>
          </v-row>
          <v-divider v-else-if="item.divider" :key="i" dark class="my-4"/>
          <v-list-item v-else :key="i" link>
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title class="grey--text">
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <div>
      <div style="text-align:right" id="search">
        <v-row>
          <v-col cols="3" md="2">
            <v-text-field v-model="word" label="Search" single-line></v-text-field>
          </v-col>
          <v-spacer></v-spacer>
          <v-col cols="2" md="1">
            <v-chip class="ma-2" @click="searchWord(word)">Search</v-chip>
          </v-col>
        </v-row>
      </div>
      <v-data-table :headers="headers" :items="words" :items-per-page="5" class="elevation-1"></v-data-table>
    </div>

  </v-app>
</template>

<script>
import wordService from '@/services/wordService'

export default {
  props: {
    source: String
  },
  methods: {
    searchWord: function (word) {
      const respCommonCode = wordService.getWordByParam(word)
      this.words = respCommonCode.data
      // this.allCategories[middleIndex].selectedCategory = null
      // console.log(selectedCategory.id)
      // const respCommonCode = await commonCodeService.getCategories(selectedCategory)
      // this.allCategories[middleIndex].categories = respCommonCode.data
      // this.showCategories[middleIndex] = true
    //   wordService.getWordByParam(word)
    //     .then(data => {
    //       this.words = data
    //     })
    //     .catch(error => {
    //       this.errored = true
    //       console.log(error.message)
    //     })
    //     .finally(() => this.loading = false)
    }
  },
  data: () => ({
    drawer: null,
    items: [
      { icon: 'lightbulb_outline', text: 'Notes' },
      { icon: 'touch_app', text: 'Reminders' },
      { divider: true },
      { heading: 'Labels' },
      { icon: 'add', text: 'Create new label' },
      { divider: true },
      { icon: 'archive', text: 'Archive' },
      { icon: 'delete', text: 'Trash' },
      { divider: true },
      { icon: 'settings', text: 'Settings' },
      { icon: 'chat_bubble', text: 'Trash' },
      { icon: 'help', text: 'Help' },
      { icon: 'phonelink', text: 'App downloads' },
      { icon: 'keyboard', text: 'Keyboard shortcuts' }
    ],
    headers: [
      {
        text: '한글명',
        align: 'start',
        sortable: true,
        value: 'name'
      },
      { text: 'Eng', value: 'engName' },
      { text: 'short-Eng', value: 'shortEng' },
      { text: 'Entity', value: 'entity' },
      { text: 'Column', value: 'column' },
      { text: 'javascript', value: 'javascript' },
      { text: 'class', value: 'wordClass' },
      { text: 'class member', value: 'WordClassMember' },
      { text: 'param value', value: 'paramValue' }
    ],
    words: [
      {
        name: '',
        engName: '',
        shortEng: '',
        entity: '',
        column: '',
        javascript: '',
        wordClass: '',
        WordClassMember: '',
        paramValue: ''
      }
    ]
  })
}
</script>
