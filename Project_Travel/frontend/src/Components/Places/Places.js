import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import './Card.css'

function Places(){

    const [data, setData] = useState([]);

    //const apiUrl="http://lochttps://66efeb53f2a8bce81be487e1.mockapi.io/student/students"
    const apiUrl="http://localhost:10000/place/allplaces"

    useEffect(()=>{
        fetch(apiUrl, {method:"GET"})
        .then(res=>res.json())
        .then(res=>setData(res));
    },[]);

    // console.log(data);


    return(
        <div className="row justify-contain-evenly" style={{backgroundColor:"#ccf3ff"}}>
            {data.map(pla=>(
                <div className="card col-4 align-center" style={{ backgroundColor:"white",width:"21rem",margin:"20px" ,border:"1px solid blue"}}>
                    <div className="row align-items-between">

                        <img src={pla.PlaceImg} className="card-img-top"/>
                        <div className="card-body">
                        <h5 className="card-title">{pla.PlaceName}</h5>
                            <p className="card-text">{pla.Location}</p>
                            <p className="card-text">Some quick example text to build .</p>
                            <Link to={`/placedetails/${pla._id}`} className="btn btn-primary me-4">Read More</Link>
                            <Link to={`/editPlace/${pla._id}`} className="btn btn-primary">Edit</Link>
                        </div>
                    </div>
                </div>
            )
            )}

        </div>
    )
}

export default Places;