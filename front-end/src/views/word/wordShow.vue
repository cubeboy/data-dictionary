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
      <div style="text-align:right" id="show">
        <v-row>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.name" label="name" :readonly = "true"></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.engName" label="engName" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.shortEng" label="shortEng" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.entity" label="entity" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.column" label="column" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.javascript" label="javascript" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.wordClass" label="wordClass" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.wordClassMember" label="wordClassMember" readonly></v-text-field>
          </v-col>
          <v-col cols="6" md="4">
            <v-text-field v-model="words.paramValue" label="paramValue" readonly></v-text-field>
          </v-col>
        </v-row>
        <router-link to="/word">
          <v-btn color="primary" dark class="mb-2">Back</v-btn>
        </router-link>
      </div>
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
  },
  data: () => ({
    drawer: null,
    name: 'na',
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
    words: { }
  }),
  async mounted () {
    try {
      const respWord = await wordService.getWord(this.$route.params.id)
      this.words = respWord.data
    } catch (error) {
      this.errored = true
      console.log(error.message)
    } finally {
      this.loading = false
    }
  }
}
</script>
