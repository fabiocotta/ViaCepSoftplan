import { useState } from "react";
import icons from "../../styles/icons";
import "./navbar.css";

const Navbar = (props) => {

    const [filtro, setFiltro] = useState("");

    return <div className="navbar">
        <img src={icons.logo} />
        <div>
            {
                props.HideBuscarCep && <>
                    <input onChange={(e) => setFiltro(e.target.value)} type="text" id="" placeholder="Logradouro..."/>
                    <button onClick={() => props.BuscarCep(filtro)} className="btn btn-blue">Pesquisar</button>

                </>
            }

        </div>

        <div className="dashboard text-right">
            {
                props.total && <>
                    <div>Total de Endereços</div>
                    <div>{props.total}</div>

                </>
            }
        </div>
    </div>

}

export default Navbar;