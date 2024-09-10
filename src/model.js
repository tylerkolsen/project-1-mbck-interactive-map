import { DataTypes, Model } from 'sequelize'
import util from 'util'
import url from 'url'
import connectToDB from './db.js'

export const db = await connectToDB('postgresql:///mbck_interactive')

export class User extends Model {
    [util.inspect.custom]() {
        return this.toJSON()
    }
}

User.init(
    {
        userId: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
        },
    },
    {
        modelName: 'user',
        sequelize: db,
    },
)

export class Collectible extends Model {
    [util.inspect.custom]() {
        return this.toJSON()
    }
}

Collectible.init(
    {
        collectibleId: {
            type: DataTypes.INTEGER,
            primaryKey: true,
        },
        title: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        reward: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        prerequisites: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        picture: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
    },
    {
        modelName: 'collectible',
        sequelize: db,
    },
)

export class UsersCollectClick extends Model {
    [util.inspect.custom]() {
        return this.toJSON()
    }
}

UsersCollectClick.init(
    {
        usersCollectClickId: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        }
    },
    {
        modelName: 'usersCollectClick',
        sequelize: db,
    }
)

export class Note extends Model {
    [util.inspect.custom]() {
        return this.toJSON()
    }
}

Note.init(
    {
        noteId: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
    },
    {
        modelName: 'note',
        sequelize: db,
    }
)

// Relationships for UsersCollectClick
User.hasMany(UsersCollectClick, { foreignKey: 'userId' })
UsersCollectClick.belongsTo(User, { foreignKey: 'userId'})

Collectible.hasMany(UsersCollectClick, { foreignKey: 'collectibleId' })
UsersCollectClick.belongsTo(Collectible, { foreignKey: 'collectibleId' })

// Relationships for Note
User.hasMany(Note, { foreignKey: 'userId' })
Note.belongsTo(User, { foreignKey: 'userId'})

Collectible.hasMany(Note, { foreignKey: 'collectibleId' })
Note.belongsTo(Collectible, { foreignKey: 'collectibleId' })

if (process.argv[1] === url.fileURLToPath(import.meta.url)) {
    console.log('Syncing database...');
    await db.sync();
    console.log('Finished syncing database!');
  }
  