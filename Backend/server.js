import express from 'express';
import session from 'express-session';
import morgan from 'morgan';
import ViteExpress from 'vite-express';
import handlerFunctions from './controller.js';

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
app.post('/api/auth', handlerFunctions.auth)

// route for checking whether a user has an existing login session
// This will check the req.session cookie for whether a userId has been saved. If so, it will repsond back with affirmation and the userId
// GET request, seeing as this will only ask for info
app.get('/api/session-check', handlerFunctions.sessionCheck)

// route for creating a new user
// This will take in the email and password for the new user, and create a new entry in the DB
// This will need to check whether the email has already been used
// POST request, as the info needs to be secure
app.post('/api/createUser', handlerFunctions.create)

// route for logging out a user from the site
// Requires the user to be logged in
// POST request, as it should be secure
app.post('/api/logout', loginRequired, handlerFunctions.logout)

// route for grabbing collectible data
// Once a square is clicked, (or a collectible is selected from history/notes) this will grab the data from the datbase based on the Id of the square.
// We'll need to gather both the collectible information, and the notes attached to it
// GET request, as we are requesting info and nothing more
app.get('/api/collect/:collectibleId', handlerFunctions.collect)

// route for adding a note to a collectible
// once this is submitted, we'll need to add a new note entry to the DB based on the collectible ID and the user ID
// POST request, as we're updating the database
app.post('/api/addNote', loginRequired, handlerFunctions.addNote)

// route for editing the description of an existing note
// This will allow the user to update the description of the note within the DB
// PUT request, as this is an edit
app.put('/api/editNote', loginRequired, handlerFunctions.editNote)

// route for getting user history information
// User must be logged in
// GET request, as we are only grabbing information from the DB
app.get('/api/history', loginRequired, handlerFunctions.history)

// route for adding history when a collectible is clicked
// User must be logged in
// POST request, as we are adding info to the DB
app.post('/api/addHistory', loginRequired, handlerFunctions.addHistory)

// route for deleting user history information
// User must be logged in
// DELETE request, as we are removing all history with this call
app.delete('/api/deleteHistory', loginRequired, handlerFunctions.deleteHistory)

// route for getting user note information
// User must be logged in
// GET request, as we are only grabbing information
app.get('/api/notes', loginRequired, handlerFunctions.notes)

ViteExpress.listen(app, port, () => console.log(`Server is listening on http://localhost:${port}`))
