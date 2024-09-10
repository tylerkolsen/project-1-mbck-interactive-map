import express from 'express';
import session from 'express-session';
import morgan from 'morgan';
import ViteExpress from 'vite-express';
import { User, Collectible, UsersCollectClick, Note } from '../src/model.js'
import controller from './controller.js';

const app = express();
const port = '8000'
ViteExpress.config({ printViteDevServerHost: true })

app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(session({ secret: 'youdontsay', saveUninitialized: true, resave: true }))

const loginRequired = (req, res, next) => {
    if (!req.session.userId) {
        res.status(401).json({ error: 'Unauthorized' })
    } else {
        next()
    }
}

// route for authentication
// This will take in the email and password of the user, and check it against the DB to see if it matches
// POST request, as it needs to be secure
app.post('/api/auth', controller.auth
//     async (req, res) => {
//     const { email, password } = req.body
//     const userCheck = await User.findOne({
//         where: { email }
//     })
//     if (userCheck && userCheck.password === password) {
//         req.session.userId = userCheck.userId
//         res.json({ success: true })
//     } else {
//         res.json({ success: false })
//     }
// }
)

// route for creating a new user
// This will take in the email and password for the new user, and create a new entry in the DB
// This will need to check whether the email has already been used
// POST request, as the info needs to be secure
app.post('/api/createUser', controller.create)

// route for logging out a user from the site
// Requires the user to be logged in
// POST request, as it should be secure
app.post('/api/logout', loginRequired, controller.logout)

// route for grabbing collectible data
// Once a square is clicked, (or a collectible is selected from history/notes) this will grab the data from the datbase based on the Id of the square.
// We'll need to gather both the collectible information, and the notes attached to it
// GET request, as we are requesting info and nothing more
app.get('/api/collect/:collectibleId', controller.collect)

// route for adding a note to a collectible
// once this is submitted, we'll need to add a new note entry to the DB based on the collectible ID and the user ID
// POST request, as we're updating the database
app.post('/api/addNote', loginRequired, async (req, res) => {
    const { userId } = req.session.userId
    const { collectibleId, description } = req.body
    await Note.create({
        description,
        userId,
        collectibleId,
    })
    res.json({ success: true })
})

// route for getting user history information
// User must be logged in
// GET request, as we are only grabbing information from the DB
app.get('/api/history', loginRequired, async (req, res) => {
    const { userId } = req.session.userId
    const userHistory = await UsersCollectClick.findAll({
        where: { userId },
    })
    res.json(userHistory)
})

// route for deleting user history information
// User must be logged in
// DELETE request, as we are removing all history with this call
app.delete('/api/deleteHistory', loginRequired, async (req, res) => {
    const { userId } = req.session.userId
    await UsersCollectClick.delete({
        where: { userId }
    })
    res.json({ sucess: true })

})

// route for getting user note information
// User must be logged in
// GET request, as we are only grabbing information
app.get('/api/notes', loginRequired, async (req, res) => {
    const { userId } = req.session.userId
    const userNotes = await Note.findAll({
        where: { userId }
    })
    res.json(userNotes)
})

ViteExpress.listen(app, port, () => console.log(`Server is listening on http://localhost:${port}`))
