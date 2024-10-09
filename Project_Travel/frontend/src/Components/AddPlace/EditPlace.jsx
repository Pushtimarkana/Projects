import { Link, useNavigate, useParams } from 'react-router-dom';
import { useState, useEffect} from 'react';
import axios from 'axios';

function EditPlace(){

    const [data, setData] = useState({
        PlaceName: "",
        PlaceImg: "",
        Location: "",
        PackagePrice: "",
        Days: "",
        More_details: "",
        Rating: ""
    });

    const [error, setError] = useState("");

    const {PlaceId}=useParams();
    console.log("id.........",PlaceId);
    
    const navigate = useNavigate();
    const apiUrl=`http://localhost:10000/place/placedetails/${PlaceId}`

    useEffect(()=>{
        fetch(apiUrl)
        .then(res=>res.json())
        .then(res=>setData(res));
    },[PlaceId]);

    

    const handleChange = ({ currentTarget: input }) =>{
        setData({
            ...data,
            [input.name]: input.value
        })
    }
    console.log("editplace.......",data);
    
    const url = `http://localhost:10000/place/editplace/${PlaceId}`;
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const res = await axios.patch(url, data);
            console.log("Response from server:", res.data); // Log response
            navigate("/places"); // Navigate after successful submission
        } catch (error) {
            console.log(error);
        }
    };
    useEffect(()=>{
        fetch(url, {method:"PATCH"})
        .then(res=>res.json())
        .then(res=>setData(res));
    },[]);
    
    return (
        
        <div class="vh-100 container" style={{backgroundImage:"url('https://tse3.mm.bing.net/th?id=OIP.U5m56nHA027gGLK3mOcXtAAAAA&pid=Api&P=0&h=180')",backgroundRepeat:"no-repeat",backgroundSize:"150vh"}}>
            <div class="container py-2 h-100">
                <form class="justify-content-center">

                    <div class="d-flex align-items-center mb-1 pb-1">
                        <i class="fas fa-cubes fa-2x me-3" style={{ color: "#ff6219" }}></i>
                        <span class="h1 fw-bold mt-4">Add place Details</span>
                    </div>

                    <div class="input-group flex-nowrap mb-3"  style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">PlaceName</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='PlaceName'
                            onChange={handleChange}
                            value={data.PlaceName}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">Place Image</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='PlaceImg'
                            onChange={handleChange}
                            value={data.PlaceImg}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">Location</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='Location'
                            onChange={handleChange}
                            value={data.Location}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">Package Price</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='PackagePrice'
                            onChange={handleChange}
                            value={data.PackagePrice}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">Days</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='Days'
                            onChange={handleChange}
                            value={data.Days}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">More details</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='More_details'
                            onChange={handleChange}
                            value={data.More_details}
                            required
                        />
                    </div>
                    <div class="input-group flex-nowrap mb-3" style={{ maxWidth: "60%" }}>
                        <span class="input-group-text" id="addon-wrapping">Rating</span>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping"
                            name='Rating'
                            onChange={handleChange}
                            value={data.Rating}
                            required
                        />
                    </div>
                    

                    {error && <div class="bg-danger p-3 border border-1">{error}</div>}
                    {/* <Link to="/home"> */}
                        <div class="mt-3 justify-content-center">
                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button"
                                onClick={handleSubmit}
                            >Edit Place</button>
                        </div>
                    {/* </Link> */}
                </form>
            </div>
        </div>
    )
}

export default EditPlace;