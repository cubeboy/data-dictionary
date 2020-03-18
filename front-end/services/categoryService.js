<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

export default{

    getCommonCodeType() {
        return new Promise((resolve, reject) => {
            axios
            .get('/')
            .then(({data}) => {
                resolve(data)
            })
            .catch(error => {
                console.log(error)
                reject(error)
            })
        })
    }
}
