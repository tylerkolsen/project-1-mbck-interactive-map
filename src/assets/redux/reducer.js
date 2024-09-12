const initialState = {
    userId: null,
    collectInfo: null
}

export default function reducer(state = initialState, action) {
    switch (action.type) {
        case "USER_AUTH":
            return { 
                ...state,
                userId: action.payload 
            }
        case "LOGOUT":
            return { 
                ...state,
                userId: null 
            }
        case "COLLECT_UPDATE":
            return {
                ...state,
                collectInfo: action.payload
            }
        default:
            return state
    }
}