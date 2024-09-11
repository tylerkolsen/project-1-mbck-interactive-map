import axios from "axios"
import { useDispatch } from "react-redux"
import { useNavigate } from "react-router-dom"

const sessionCheck = () => {
  const navigate = useNavigate()
  const dispatch = useDispatch()


    console.log('sessionCheck has begun')
    axios.get('/api/session-check')
    .then((res) => {
        if (res.data.success) {
            dispatch({
                type: "USER_AUTH",
                payload: res.data.userId
            })
            console.log('sessionCheck has occured')
            navigate("/Home")
        } else {
            console.log('sent user back to login')
            navigate("/")
        }
    })
}


export default sessionCheck