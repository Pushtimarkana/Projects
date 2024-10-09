import { useEffect, useState } from "react";
import { Link, useParams ,useNavigate} from "react-router-dom";
import axios from 'axios';


function PlaceDetail(){

    const [data, setData] = useState({
        PlaceImg: "",
          PlaceName:"",
          Location:"",
          PackagePrice:"",
          Days:"",
          More_details:"",
          Rating:""
    });
    const {PlaceId}=useParams();
    console.log("id.........",PlaceId);
    const navigate=useNavigate();

    //const apiUrl="http://lochttps://66efeb53f2a8bce81be487e1.mockapi.io/student/students"
    const apiUrl=`http://localhost:10000/place/placedetails/${PlaceId}`

    useEffect(()=>{
        fetch(apiUrl, {method:"GET"})
        .then(res=>res.json())
        .then(res=>setData(res));
    },[PlaceId]);

    const handledelete = async (e) => {
        e.preventDefault();
        try {
            const url = `http://localhost:10000/place/${PlaceId}`;
            const res = await axios.delete(url, data);
            console.log("Response from server:", res.data); // Log response
            navigate("/places"); // Navigate after successful deletion
        } catch (error) {
            console.log("delete error:",error);
        }
    };

    return(
        <>
            <div  className="container-fluid" style={{height:"100px", padding:"30px"}}>
                <Link to="/places" className="btn btn-primary">Back</Link>
                <button className="btn btn-danger" onClick={handledelete }>Delete</button>
            </div>
            
            <div className="row container-fluid">
                <div className="col">
                        <img src={data.PlaceImg}  width={"100%"} height={"500vh"} />
                </div>
                <div className="col">
                        <tr><td><h1>Place Name  :  {data.PlaceName}</h1></td></tr>
                        <tr><td><h2>Location  :  {data.Location}</h2></td></tr>
                        <tr><td><h4>PackagePrice  :  {data.PackagePrice}</h4></td></tr>
                        <tr><td><h4>Days  :  {data.Days}</h4></td></tr>
                        <tr><td><h4>Details  :  {data.More_details}</h4></td></tr>
                        <tr><td><h4>Rating  :  {data.Rating}</h4></td></tr>
                </div>
            </div>
            
            
            </>
        );
}

export default PlaceDetail;