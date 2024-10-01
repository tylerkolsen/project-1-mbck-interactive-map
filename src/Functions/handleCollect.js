import axios from "axios"

const handleCollect = (id, setDisplayModal, dispatch) => {

    axios.get(`/api/collect/${id}`)
    .then((res) => {
        if (res.data.collectible) {
            axios.post('/api/addHistory', {
                collectibleId: id
            })
            dispatch({
                type: "COLLECT_UPDATE",
                payload: res.data.collectible
            })
        setDisplayModal(true)
        } else {
            console.error("Information not found")
        }
    })
}

export default handleCollect