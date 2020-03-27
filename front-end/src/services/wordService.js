import axios from 'axios'

export default {
  async getWordByParam (param) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/word/',
      params: { wordParam: param }
    })
  },
  async getWord (id) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/word/' + id
    })
  },
  async createWord (param) {
    return axios({
      method: 'POST',
      url: 'http://localhost:3000/word/',
      params: { wordParam: param }
    })
  },
  async updateWord (param) {
    return axios({
      method: 'PATCH',
      url: 'http://localhost:3000/word/' + param.id,
      params: { wordParam: param }
    })
  },
  async destroyWord (id) {
    return axios({
      method: 'DELETE',
      url: 'http://localhost:3000/word/' + id
    })
  }

}
