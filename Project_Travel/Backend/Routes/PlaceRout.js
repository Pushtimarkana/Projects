const express = require("express");
const router = express.Router();
const Place = require('../Schema/Place')


// GET all places
router.get('/allplaces', async (req, res) => {
  try {
    const places = await Place.find({});
    console.log("Fetched places:", places);

    res.status(200).json(places); // Return the fetched places
  } catch (error) {
    console.error("Error fetching places:", error);
    res.status(500).send("Server error...");
  }
});

///GET BY ID
router.get('/placedetails/:PlaceId', async (req, res) => {
  
  try {
    const places = await Place.findById({_id:req.params.PlaceId});
    console.log("Fetched places:", places);

    res.status(200).json(places); // Return the fetched places
  } catch (error) {
    console.error("Error fetching places:", error);
    res.status(500).send("Server error...");
  }
});

//  ADD DATA
router.post('/add',async (req, res) => {
  try {
    
    // const place = new Place(req.body)
    // await place.save()
    
    const place = new Place({
      ...req.body,
      PackagePrice: Number(req.body.PackagePrice),
      Days: Number(req.body.Days)
    }).save()
    console.log("Fetched places:",place);
  
    res.status(200).json("added"); // Return the fetched places
  } catch (error) {
    console.error("Error fetching places:", error);
    res.status(500).send("Server error...");
  }
})


////EDIT DATA
router.patch('/editplace/:PlaceId', async (req, res) => {
  try {
    const  _id  = req.params.PlaceId;
    const updatedTrip = await Place.findByIdAndUpdate(_id,{...req.body },{ new: true, runValidators: true });

    if (!updatedTrip) {
        return res.status(404).json({ message: 'Trip not found' });
    }

    res.status(200).json(updatedTrip);
  } catch (error) {
      res.status(500).json({ message: 'Server error', error: error.message });
  }
});

//DELETE DATA
router.delete('/:PlaceId',async(req,res)=>{
  try{
    
        const deletedTrip = await Place.findByIdAndDelete({_id:req.params.PlaceId});

        if (!deletedTrip) {
            return res.status(404).json({ message: 'Trip not found' });
        }

        res.status(200).json({ message: 'Trip deleted successfully' });
    // const deletedPlace= await places.deleteOne(req.params.PlaceId);

  }catch(error){
    console.error("Error fetching places:", error);
    res.status(500).send("Server error...");
  }
})


module.exports = router;
