import { Link, Outlet } from "react-router-dom";
import Navbar from './Navbar/navbar.js';




function Layout(){
    return(
            <>
            <Navbar/>
            <Outlet/>
            </>

    );
}

export default Layout;