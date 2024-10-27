const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const app = express()

app.use(cors())
app.use(express.static('public'))
app.use(bodyParser.urlencoded({ extended: false }))

let users = []
let exercises = []

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/views/index.html')
})

// Create a new user
app.post('/api/users', (req, res) => {
    const { username } = req.body
    const newUser = { username, _id: Date.now().toString() }
    users.push(newUser)
    res.json(newUser)
})

//  Get all users
app.get('/api/users', (req, res) => {
    const usersList = users.map(user => ({
        username: user.username,
        _id: user._id
    }))
    res.json(usersList)
})

// Add exercises 
app.post('/api/users/:_id/exercises', (req, res) => {
    const { _id } = req.params
    const { description, duration, date } = req.body

    const user = users.find(user => user._id === _id)
    if (!user) return res.status(404).json({ error: "User not found" })

    const exerciseDate = date ? new Date(date) : new Date()
    const exercise = {
        username: user.username,
        description,
        duration: parseInt(duration),
        date: exerciseDate.toDateString(),
        _id: user._id
    }

    exercises.push(exercise)
    res.json({
        username: exercise.username,
        description: exercise.description,
        duration: exercise.duration,
        date: exercise.date,
        _id: exercise._id
    })
})

// User's exercise, get
app.get('/api/users/:_id/logs', (req, res) => {
    const { _id } = req.params
    const { from, to, limit } = req.query

    const user = users.find(user => user._id === _id)
    if (!user) return res.status(404).json({ error: "User is not found" })

    let userExercises = exercises.filter(ex => ex._id === user._id)


    if (from) {
        const fromDate = new Date(from)
        userExercises = userExercises.filter(ex => new Date(ex.date) >= fromDate)
    }
    if (to) {
        const toDate = new Date(to)
        userExercises = userExercises.filter(ex => new Date(ex.date) <= toDate)
    }

    // Optional limit
    if (limit) userExercises = userExercises.slice(0, parseInt(limit))

    res.json({
        username: user.username,
        count: userExercises.length,
        _id: user._id,
        log: userExercises.map(({ description, duration, date }) => ({
            description,
            duration,
            date
        }))
    })
})


const listener = app.listen(process.env.PORT || 3000, () => {
    console.log('Your app is listening on port ' + listener.address().port)
})
