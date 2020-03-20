import axios from 'axios'

export default {

  async getCategories (queryParams) {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/common_code/',
      params: {
        codeTypeId: queryParams.codeTypeId,
        id: queryParams.id
      }
    })
  }
}
