import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

import Home from './Components/Home/Home.js'
import Places from './Components/Places/Places.js';
import Layout from './Components/Layout.js';
import PlaceDetail from './Components/Places/PlaceDetail.js';
import AddPlace from './Components/AddPlace/AddPlace.jsx';
import SignIn from './Components/SignInUp/SignIn.jsx';
import SignUp from './Components/SignInUp/SignUp.jsx';
import Activites from './Components/Places/Activites.jsx';
import EditPlace from './Components/AddPlace/EditPlace.jsx';

 

const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  <>
    <BrowserRouter>
    <Routes>
      <Route path='/' element={<Layout />}>
        <Route path='/home' element={<Home />} />
        <Route path="/places" element={<Places />} />
        <Route path="/placedetails/:PlaceId" element={<PlaceDetail />} />
        <Route path="/addNewPlace" element={<AddPlace />} />
        <Route path="/editPlace/:PlaceId" element={< EditPlace/>}/>
        <Route path="/activities" element={<Activites />} />
        <Route path="/signIn" element={<SignIn/>}/>
        <Route path="/signUp" element={<SignUp/>}/>
      </Route>
    </Routes>
  </BrowserRouter>
  </>
);
