import React from "react";
import { Link, Outlet } from "react-router-dom";
import './navbar.css'

function Navbar(){
    return(
        <nav className="navbar navbar-expand-lg navbar-light bg-pink">
            <div className="container-fluid">
              {/* <a className="navbar-brand" href="#">Navbar</a> */}
              <span className="icon"><img src="https://img.freepik.com/free-vector/flat-vintage-travel-logo_23-2148182562.jpg?t=st=1728278349~exp=1728281949~hmac=7d63d9e0763e3ae447fc88a6fe4ad2cfc18ed61d04ef9d0bcf1c7512121f11e6&w=740" style={{width:"50px",height:"40px"}}/></span>
              <div className="collapse navbar-collapse" id="navbarSupportedContent">
                <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                  <li className="nav-item">
                    <Link class="nav-link btn btn-outline-info" to="/home">Home</Link>
                  </li>
                  <li className="nav-item">
                    <Link class="nav-link btn btn-outline-info" to="/places">Places</Link>
                  </li>
                  
                  <li className="nav-item">
                    <Link class="nav-link btn btn-outline-info" to="/addNewPlace">Add Place</Link>
                  </li>

                  <li className="nav-item">
                    <Link class="nav-link btn btn-outline-info" to="/activities">Activities</Link>
                  </li>
                </ul>
                <table className="d-flex">
                  <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                  <button className="btn btn-outline-success" type="submit">Search</button>
                </table>
              </div>
            </div>
</nav>
    )
}
export default Navbar;