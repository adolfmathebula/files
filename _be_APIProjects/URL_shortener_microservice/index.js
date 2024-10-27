const express = require('express');
require('dotenv').config(); 
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
const validUrl = require('valid-url');

const dns = require('dns');
const urlParser = require('url');


const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', (req, res) => {
    res.sendFile(process.cwd() + '/views/index.html');
});

// First API endpoint
app.get('/api/hello', (req, res) => {
    res.json({ greeting: 'hello API' });
});

// Connect to MongoDB 
mongoose.connect(process.env.MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => console.error('MongoDB connection error:', err));

// URL Schema
const urlSchema = new mongoose.Schema({
    original_url: { type: String, required: true },
    short_url: { type: Number, required: true }
});

const Url = mongoose.model('Url', urlSchema);

// Short URL creation
app.post('/api/shorturl', async (req, res) => {
    let { url } = req.body;

    if (!url) {
        return res.json({ error: 'invalid url' });
    }

    // Ensure the URL has a protocol; otherwise, add 'http://'
    if (!/^https?:\/\//i.test(url)) {
        url = 'http://' + url;
    }

    // Validate URL format
    if (!validUrl.isUri(url)) {
        return res.json({ error: 'invalid url' });
    }

    const { hostname } = urlParser.parse(url);

    dns.lookup(hostname, async (err) => {
        if (err) {
            return res.json({ error: 'invalid url' });
        }

        try {
            // Check if URL already exists
            const foundUrl = await Url.findOne({ original_url: url });
            if (foundUrl) {
                return res.json({ original_url: foundUrl.original_url, short_url: foundUrl.short_url });
            }

            // Generate and save new short URL
            const count = await Url.countDocuments();
            const newUrl = new Url({ original_url: url, short_url: count + 1 });
            await newUrl.save();

            return res.json({ original_url: newUrl.original_url, short_url: newUrl.short_url });
        } catch (error) {
            return res.status(500).json({ error: 'Database error' });
        }
    });
});

// Redirect to the original URL
app.get('/api/shorturl/:short_url', async (req, res) => {
  const { short_url } = req.params;

  try {
      // Find the URL using async/await
      const foundUrl = await Url.findOne({ short_url });

      if (foundUrl) {
          return res.redirect(foundUrl.original_url);
      } else {
          return res.json({ error: 'No short URL found for the given input' });
      }
  } catch (err) {
      return res.status(500).json({ error: 'Database error' });
  }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});
