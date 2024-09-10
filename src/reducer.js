const initialState = {
    auth: false
}

export default function reducer(state = initialState, action) {
    switch (action.type) {
        case "update":
            return { auth: true }
        default:
            return state
    }
}