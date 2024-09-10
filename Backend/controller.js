
import { User, Collectible, UsersCollectClick, Note } from '../src/model.js'

const controller = {
    auth: 
        async (req, res) => {
        const { email, password } = req.body
        const userCheck = await User.findOne({
            where: { email }
        })
        if (userCheck && userCheck.password === password) {
            req.session.userId = userCheck.userId
            res.json({ success: true })
        } else {
            res.json({ success: false })
        }
    },
    create: 
        async (req, res) => {
        const { email, password } = req.body
        const emailCheck = await User.findOne({
            where: { email }
        })
        if (!emailCheck) {
            await User.create({
                email,
                password,
            })
            res.json({ success: true })
        } else {
            res.json({ success: false })
        }
    },
    logout: 
        async (req, res) => {
        req.session.destroy()
        res.json({ success: true })
    },
    collect: 
    async (req, res) => {
        const { collectibleId } = req.params
        const singleCollect = await Collectible.findOne({
            where: { collectibleId },
            include: Note
            }
        )
        res.json(singleCollect)
    }

}

export default controller