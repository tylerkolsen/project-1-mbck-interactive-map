const initialState = {
    userId: null
}

export default function reducer(state = initialState, action) {
    switch (action.type) {
        case "USER_AUTH":
            return { userId: action.payload }
        case "LOGOUT":
            return { userId: null }
        default:
            return state
    }
}