const initialState = {
    userId: null,
    collectInfo: null,
    userNote: [],
    userHistory: [],
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
                userId: null,
                collectInfo: null,
                userNote: [],
                userHistory: [],
            }
        case "COLLECT_UPDATE":
            return {
                ...state,
                collectInfo: action.payload
            }
        case "NOTE_UPDATE":
            return {
                ...state,
                userNote: action.payload
            }
        case "HISTORY_UPDATE":
            return {
                ...state,
                userHistory: action.payload
            }
        default:
            return state
    }
}