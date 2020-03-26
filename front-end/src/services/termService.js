import axios from 'axios'

export default {

  async getTermInfo (params) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/term',
      params: params
    })
  }
}
