import { User, Collectible, UsersCollectClick, Note } from '../src/model.js'
import bcryptjs from 'bcryptjs'
import { Sequelize } from 'sequelize'

const sequelize = new Sequelize('postgresql:///mbck_interactive')

const handlerFunctions = {
    auth: 
        async (req, res) => {
        const { email, password } = req.body
        const userCheck = await User.findOne({
            where: { email }
        })

        // Check for whether the email is in the database
        if (!userCheck) {
            res.send({
                message: "no username found",
                success: false
            })
            return
        }
        // Check for whether the password matches
        if (!bcryptjs.compareSync(password, userCheck.password)) {
            res.send({
                message: "password does not match",
                success: false
            })
            return
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

        if (!emailCheck) {

            const hashedPassword = bcryptjs.hashSync(password, bcryptjs.genSaltSync(10))

            const newUser = await User.create({
                email,
                password: hashedPassword,
            })

            req.session.userId = newUser.userId

            res.send({ 
                message: "user created",
                success: true, 
                userId: newUser.userId
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
            include: [{
                model: Note
            }]
        })
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
            where: { userId },
            include: [{
                model: Collectible,
                attributes: ['title'],
            }],
            order: [
                sequelize.col('collectible'),
                sequelize.col('noteId')
            ]

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
        console.log(noteToEdit)
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
    },

    deleteNote:
    async (req, res) => {
        const { noteId } = req.params
        console.log("hit deleteNote")
        console.log(noteId)
        await Note.destroy({
            where: { noteId }
        })
        res.send({ 
            message: "note deleted successfully",
            success: true 
        })
    }
}

export default handlerFunctions