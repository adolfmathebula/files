var express = require('express');
var cors = require('cors');
var multer = require('multer');
require('dotenv').config();

var app = express();

app.use(cors());
app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function (req, res) {
    res.sendFile(process.cwd() + '/views/index.html');
});

// Configure Multer 
const upload = multer({ dest: 'uploads/' });

// Endpoint /api/fileanalyse
app.post('/api/fileanalyse', upload.single('upfile'), (req, res) => {
    const { originalname: name, mimetype: type, size } = req.file;
    res.json({ name, type, size });
});

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log('Your app is listening on port ' + port);
});