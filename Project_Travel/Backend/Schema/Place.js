const mongoose = require('mongoose');

const placeSchema = new mongoose.Schema({
    PlaceName: { type: String, required: true },
    PlaceImg: { type: String, required: true },
    Location: { type: String, required: true },
    PackagePrice: { type: Number, required: true },
    Days: { type: Number, required: true },
    More_details: { type: String, required: true },
    Rating: { type: String, required: true } // or Number, depending on your use case
});

const Place = mongoose.model('Place', placeSchema);
module.exports = Place;
