import axios from 'axios'

export default {
  async getWordByParam (param) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/word',
      params: { wordParam: param }
    })
  }
}
