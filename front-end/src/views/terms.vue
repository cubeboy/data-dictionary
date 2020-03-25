<template>
  <v-app id="keep">
    <v-app-bar app clipped-left color="amber">
      <v-app-bar-nav-icon @click="drawer = !drawer" />
      <div class="title ml-3 mr-5 align-center justify-center">용어검색</div>
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
      <v-container fluid class="grey lighten-4 fill-height">
        <v-row justify="center" align="center">
          <SearchCard/>
        </v-row>
        <v-row justify="center" align="center">
          <v-data-table :headers="headers" :items="words" :items-per-page="5" class="elevation-1"></v-data-table>
        </v-row>
        <v-row justify="center" align="center">
            <div v-if="searchWord == null">
              <h1>검색을 진행하세요</h1>
            </div>
            <div v-else>
              <DiscriptionCard :word='word'/>
            </div>
        </v-row>
      </v-container>
  </v-app>
</template>

<script>
import SearchCard from '@/components/SearchCard.vue'
import DiscriptionCard from '@/components/DiscriptionCard.vue'
export default {
  props: {
    source: String
  },
  data: () => ({
    drawer: null,
    searchWord: null,
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
    word: {
      id: null,
      word: '계좌 번호',
      meaning: '은행 등에서 저축이나 대출 상황 등을 기록하고 관리하기 위해 고객에게 부여하는 식별 번호.',
      variables: ['계좌', '번호']
    },
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
    ]
  }),
  mounted () {
    this.searchWord = this.$route.params.word
  },
  components: {
    SearchCard,
    DiscriptionCard
  }
}
</script>

<style>
#keep .v-navigation-drawer__border {
  display: none
}
</style>
