import axios from 'axios'

export default {

  async getCommonCodeType () {
    return axios({
      method: 'GET',
      url: 'http://localhost:3000/'
    })

    // return new Promise((resolve, reject) => {
    //   axios
    //     .get('/')
    //     .then(({ data }) => {
    //       resolve(data)
    //     })
    //     .catch(error => {
    //       console.log(error)
    //       reject(error)
    //     })
    // })
  }
}
