
import { User, Collectible, UsersCollectClick, Note } from '../src/model.js'

const handlerFunctions = {
    auth: 
        async (req, res) => {
        const { email, password } = req.body
        const userCheck = await User.findOne({
            where: { email }
        })
        // Check for whether the email is in the database
        if (!userCheck[0]) {
            res.send({
                message: "no username found",
                success: false
            })
        }
        // Check for whether the password matches
        if (userCheck.password !== password) {
            res.send({
                message: "password does not match",
                success: false
            })
        }
        // If we've reached here, the user exists and the password matches
            req.session.userId = userCheck.userId
            res.send({ 
                message: "user logged in",
                success: true,
                userId: req.session.userId
            })

    },

    create: 
        async (req, res) => {
        const { email, password } = req.body
        const emailCheck = await User.findOne({
            where: { email }
        })
        if (!emailCheck[0]) {
            await User.create({
                email,
                password,
            })

            req.session.userId = emailCheck.userId

            res.send({ 
                message: "user created",
                success: true, 
                userId: emailCheck.userId
            })

        } else {
            res.send({ 
                message: "username already exists",
                success: false
            })
        }
    },

    logout: 
        async (req, res) => {
        req.session.destroy()
        res.send({ 
            message: "user logged out",
            success: true 
        })
    },

    collect: 
    async (req, res) => {
        const { collectibleId } = req.params
        const singleCollect = await Collectible.findOne({
            where: { collectibleId },
            include: Note
            }
        )
        res.send({
            message: "collectible information gathered",
            collectible: singleCollect
        })
    },

    addNote: 
    async (req, res) => {
        const { userId } = req.session
        const { collectibleId, description } = req.body
        await Note.create({
            description,
            userId,
            collectibleId,
        })
        res.send({ 
            message: "Note added successfully",
            success: true 
        })
    },

    history:
    async (req, res) => {
        const { userId } = req.session
        const userHistory = await UsersCollectClick.findAll({
            where: { userId },
        })
        res.send({
            message: "history list gathered",
            history: userHistory
        })
    },

    deleteHistory:
    async (req, res) => {
        const { userId } = req.session
        await UsersCollectClick.destroy({
            where: { userId }
        })
        res.send({ 
            message: "history deleted successfully",
            success: true 
        })
    },

    notes:
    async (req, res) => {
        const { userId } = req.session
        const userNotes = await Note.findAll({
            where: { userId }
        })
        res.send({
            message: "note list gathered",
            notes: userNotes
        })
    },

    editNote:
    async (req, res) => {
        const { noteId, description } = req.body
        let noteToEdit = await Note.findByPk(noteId)
        await noteToEdit.update({
            description
        })

        res.send({
            message: "note updated succesfully",
            success: true
        })
    },

    sessionCheck:
    async (req, res) => {
        if (req.session.userId) {
            res.send({
                message: "user is still logged in",
                success: true,
                userId: req.session.userId
            })
        } else {
            res.send({
                message: "no user logged in",
                success: false
            })
        }
    },

    addHistory:
    async (req, res) => {
        const { userId } = req.session
        const { collectibleId } = req.body
        console.log(userId)
        console.log(collectibleId)
        const clickHistory = await UsersCollectClick.findAll({
            where: { collectibleId }
        })

        if (clickHistory[0]) {
            res.send({
                message: "user history already exists",
                success: false
            })
        } else {
            await UsersCollectClick.create({
                userId,
                collectibleId
            })
            res.send({
                message: "user history saved",
                success: true
            })
        }

    }
}

export default handlerFunctions