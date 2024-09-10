import { User, Collectible, Note, db } from '../src/model.js'
import collectSet from '../Backend/collectSet.js'
import lodash from 'lodash' 

console.log('Syncing database...')
await db.sync({ force: true })

console.log('Seeding database...')

// convert the set into an array, so that it can be used within promise.all()
const setArr = [...collectSet]

// creation of collectible database
const collectsInDB = await Promise.all(
    setArr.map((col) => {

        const newCollect = Collectible.create({
            collectibleId: col,
            title: `title ${col}`,
            reward: `reward ${col}`,
            prerequisites: `prereq ${col}`,
            picture: `picture ${col}`,
            description: `desc ${col}`,
        })

        return newCollect
    })

)

console.log(collectsInDB)

// creation of user database
// This section creates an array of objects with the email and password key
const usersToCreate = [];
for (let i = 0; i < 3; i++) {
    const email = `user${i}@test.com`
    usersToCreate.push(User.create({ email: email, password: 'test'}))
}

// This section actually creates the user entries and places them within the DB
const usersInDB = await Promise.all(usersToCreate)

console.log(usersToCreate)

const notesInDB = await Promise.all(
    usersInDB.flatMap((user) => {
        // Get 3 random collectibles
        const randomNotes = lodash.sampleSize(collectsInDB, 3)

        // Create a note for each collectible
        const collectNotes = randomNotes.map((col) => {
            return Note.create({
                description: `Note ${col.collectibleId}`,
                userId: user.userId,
                collectibleId: col.collectibleId,
            })
        })
        return collectNotes
    })
)

console.log(notesInDB)

await db.close()
console.log('Finished seeding database!')

