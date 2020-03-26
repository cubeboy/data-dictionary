import axios from 'axios'

export default {

  async getTerms (quaryParams) {
    return axios({
      method: "GET",
      url: 'http://localhost:3000/term',
      params: { params: quaryParams }
    })
  }
}
