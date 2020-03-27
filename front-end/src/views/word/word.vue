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

      <v-data-table v-model="selected" :headers="headers" :items="words" :items-per-page="10" sort-by="calories" class="elevation-1" @click:row="show">

        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="350px">
              <template v-slot:activator="{ on }">
                <v-btn color="primary" dark class="mb-2" v-on="on">New Item</v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="headline">{{ formTitle }}</span>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" md="12">
                        <v-text-field v-model="editedItem.name" label="한글명"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="12">
                        <v-text-field v-model="editedItem.engName" label="Eng"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="12">
                        <v-text-field v-model="editedItem.shortEng" label="short-Eng"></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                  <v-btn color="blue darken-1" text @click="save">Save</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>

        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
          <v-icon small @click="deleteItem(item)">
            mdi-delete
          </v-icon>
        </template>

      </v-data-table>

    </div>

  </v-app>
</template>

<script>
import wordService from '@/services/wordService'

export default {
  props: {
    source: String
  },
  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'New Word' : 'Edit Word'
    }
  },
  watch: {
    dialog (val) {
      val || this.close()
    }
  },
  methods: {
    searchWord: async function (word) {
      try {
        this.param.search = word.trim()
        const respWords = await wordService.getWordByParam(this.param)
        this.words = respWords.data
      } catch (error) {
        this.errored = true
        console.log(error.message)
      } finally {
        this.loading = false
      }
    },
    show (item) {
      if (event.target.classList.contains('btn__content')) return
      if (event.target.type === 'button') return
      this.$router.push({ name: 'WordShow', params: { id: item.id } })
    },
    editItem (item) {
      this.editedIndex = this.words.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialog = true
    },
    async deleteItem (item) {
      // const index = this.words.indexOf(item)
      confirm('Are you sure you want to delete this item?') && await wordService.destroyWord(item.id) && this.searchWord(this.word)
    },
    close () {
      this.dialog = false
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      }, 300)
    },
    async save () {
      if (this.editedIndex > -1) {
        try {
          const strShoreEng = this.editedItem.shortEng
          this.editedItem.entity = 'T_' + strShoreEng
          this.editedItem.column = this.getLowerCase(strShoreEng)
          this.editedItem.javascript = this.getLowerCase(strShoreEng)
          this.editedItem.wordClass = strShoreEng
          this.editedItem.wordClassMember = this.getLowerCase(strShoreEng)
          this.editedItem.paramValue = this.getLowerCase(strShoreEng)

          await wordService.updateWord(this.editedItem)
          this.searchWord(this.word)
        } catch (error) {
          this.errored = true
          console.log(error.message)
        } finally {
          this.loading = false
        }
      } else {
        try {
          const strShoreEng = this.editedItem.shortEng
          this.editedItem.entity = 'T_' + strShoreEng
          this.editedItem.column = this.getLowerCase(strShoreEng)
          this.editedItem.javascript = this.getLowerCase(strShoreEng)
          this.editedItem.wordClass = strShoreEng
          this.editedItem.wordClassMember = this.getLowerCase(strShoreEng)
          this.editedItem.paramValue = this.getLowerCase(strShoreEng)

          await wordService.createWord(this.editedItem)
          this.searchWord(this.word)
        } catch (error) {
          this.errored = true
          console.log(error.message)
        } finally {
          this.loading = false
        }
      }
      this.close()
    },
    getLowerCase (strShoreEng) {
      return strShoreEng.charAt(0).toLowerCase() + strShoreEng.slice(1)
    }

  },
  data: () => ({
    drawer: null,
    word: '',
    selected: [],
    dialog: false,
    items: [
      { icon: 'lightbulb-outline', text: 'Notes' },
      { icon: 'cursor-pointer', text: 'Reminders' },
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
    param: {
      search: ''
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
      { text: 'class member', value: 'wordClassMember' },
      { text: 'param value', value: 'paramValue' },
      { text: 'Actions', value: 'actions', sortable: false }
    ],
    editedIndex: -1,
    editedItem: {
      name: '',
      engName: '',
      shortEng: '',
      entity: '',
      column: '',
      javascript: '',
      wordClass: '',
      wordClassMember: '',
      paramValue: ''
    },
    defaultItem: {
      name: '',
      engName: '',
      shortEng: '',
      entity: '',
      column: '',
      javascript: '',
      wordClass: '',
      wordClassMember: '',
      paramValue: ''
    },
    words: []
  }),
  async mounted () {
    try {
      // this.param.search = word.trim()
      const respWords = await wordService.getWordByParam(this.param)
      this.words = respWords.data
    } catch (error) {
      this.errored = true
      console.log(error.message)
    } finally {
      this.loading = false
    }
  }
}
</script>
