import React from 'react';
import ReactDOM from 'react-dom/client';
import Home from './pages/home/home.jsx';
import CadEndereco from './pages/cad-endereco/cad-endereco.jsx';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import "./styles/global.css"


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<div>
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<Home />} />
      <Route path='/endereco' element={<CadEndereco />} />
    </Routes>
  </BrowserRouter>
</div>

);