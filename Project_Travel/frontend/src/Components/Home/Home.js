import React from 'react'
import { Link } from 'react-router-dom';

function Home(){
    return(
        <>
            <div className=" vh-100 container bg-opacity-50" style={{backgroundImage:"url('https://wallpapercave.com/wp/wp4069426.jpg')",backgroundRepeat:"no-repeat",backgroundSize:"200vh",height:"200vh",width:"200vh"}}>
                    <div style={{float:"right"}}>
                        <Link class="btn btn-info" to="/SignIn" style={{margin:"10px"}}>Sign In</Link>
                        <Link class="btn btn-info" to="/SignUp">Sign Up</Link>
                    </div>
                   <h1>WelCome Home</h1>
            </div>
        </>
    );
}
export default Home;