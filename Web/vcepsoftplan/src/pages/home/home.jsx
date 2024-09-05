import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import Sidebar from "../../components/sidebar/sidebar.jsx";
import Navbar from "../../components/navbar/navbar.jsx";
import "../../styles/global.css"
import "./home.css";
import icons from "../../styles/icons.js";
import api from "../../services/api.js";
import { confirmAlert } from "react-confirm-alert";
import "react-confirm-alert/src/react-confirm-alert.css";

const Home = (props) => {
    const [enderecos, setEnderecos] = useState([]);
    const [total, setTotal] = useState(0);

    //acessando dados da nossa api
    const ListarEnderecos = async (filtro) => {
        try {
            const response = await api.get("/ceps", {
                params: {
                    filtro: filtro
                }
            });
            setEnderecos(response.data);

            let qtdEnderecos = 0;
            for (var i = 0; i < response.data.length; i++) {
                qtdEnderecos = response.data.length;
            }

            setTotal(qtdEnderecos);

        } catch (error) {
            alert("Error ao buscar dados");
            console.log(error);
        }

    }

    //nossa funcao para editar enderecos
    const OpenEndereco = (idCeps) => {
        navigate("/endereco/" + idCeps);
    }

    //nossa funcao para deletar enderecos
    const DeleteEndereco = (idCeps) => {
        //mudar depois para a chamada da api
        try {
            confirmAlert({
                title: "Exclusão",
                message: "Confirma a exclusão do endereço?",
                buttons: [{
                    label: "Sim",
                    onClick: async () => {
                        await api.delete("/ceps/" + idCeps);
                        ListarEnderecos();
                    }


                    },
                    {
                    label: "Não",
                    onClick: () => { }
                }]
            });


        } catch (error) {

        }

    }

    useEffect(() => {
        ListarEnderecos();
    }, [])

    const navigate = useNavigate();
    return <>
        <Sidebar />
        <Navbar BuscarCep={ListarEnderecos}
            total={total}
            HideBuscarCep={true} />

        <div className="container-home">
            <div className="title-home">
                <h1>Endereços</h1>
                <button onClick={() => navigate("/endereco/add")} className="btn btn-green">Adicionar Endereço</button>
            </div>
            <div className="box-endereco">
                <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Cep</th>
                            <th>Logradouro</th>
                            <th>Complemento</th>
                            <th>Bairro</th>
                            <th>Localidade</th>
                            <th>Uf</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            enderecos.map((end) => {
                                return <tr>
                                    <td>{end.idCeps}</td>
                                    <td>{end.cep}</td>
                                    <td>{end.logradouro}</td>
                                    <td>{end.complemento}</td>
                                    <td>{end.bairro}</td>
                                    <td>{end.localidade}</td>
                                    <td>{end.uf}</td>
                                    <td className="text-right">
                                        <button onClick={() => OpenEndereco(end.idCeps)} className="btn btn-blue">
                                            <img className="icon-sm" src={icons.edit} />
                                        </button>
                                        <button onClick={() => DeleteEndereco(end.idCeps)} className="btn btn-red ml-10">
                                            <img className="icon-sm" src={icons.remove} />
                                        </button>
                                    </td>
                                </tr>
                            })
                        }
                    </tbody>
                </table>

                {
                    enderecos.length == 0 && <div className="imgEmpty">
                        <img src={icons.empty} />
                    </div>
                }
            </div>
        </div>
    </>
}
export default Home;