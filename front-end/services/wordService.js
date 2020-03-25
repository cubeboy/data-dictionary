import axios from 'axios'

export default {
  getWordByParam (word) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/word',
      params: {
        search: word
      }
    })
  }
}
