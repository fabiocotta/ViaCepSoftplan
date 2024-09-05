import Sidebar from "../../components/sidebar/sidebar.jsx"
import Navbar from "../../components/navbar/navbar.jsx";
import "./cad-endereco.css";
import { useNavigate, useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import api from "../../services/api.js";

const CadEndereco = () => {

    const { idUrl } = useParams();
    const { idCeps } = useParams();
    const navigate = useNavigate();
    const [cep, setCep] = useState(0);
    const [logradouro, setLogradouro] = useState("");
    const [complemento, setComplemento] = useState("");
    const [bairro, setBairro] = useState("");
    const [localidade, setLocalidade] = useState("");
    const [uf, setUf] = useState("");


    //funcao criada para salvar os dados
    const SalvarDados = async() => {

        try {
            if (idUrl != "add") {
                await api.put("/ceps/"+ idUrl, {
                    cep,
                    logradouro,
                    complemento,
                    bairro,
                    localidade,
                    uf

                });
                
            } else {
                await api.post("/ceps/", {
                    cep,
                    logradouro,
                    complemento,
                    bairro,
                    localidade,
                    uf

                });

            }
            
            navigate("/");
            
        } catch (error) {
            
        }
       

    }

    //carregando os dados para edição
    const DadosEndereco = async (idCeps) => {
        try {
            const response = await api.get("/ceps/" + idCeps);
            setCep(response.data.cep);
            setLogradouro(response.data.logradouro);
            setComplemento(response.data.complemento);
            setBairro(response.data.bairro);
            setLocalidade(response.data.localidade);
            setUf(response.data.uf);



        } catch (error) {
            alert("Ocorreu um erro ao buscar os dados")

        }


    };

    useEffect(() => {
        if (idUrl != "add") {
            DadosEndereco(idUrl);
        } else
            DadosEndereco(idCeps)
    }, []);

    return <>
        <Sidebar />
        <Navbar />



        <div className="container-cadendereco">

            <div className="box-cadendereco">
                {
                    idUrl == "add" ? <h1>Novo Endereço</h1> : <h1>Editar Endereço</h1>
                }


                <div className="input-group">
                    <p>Cep</p>
                    <input type="text" className="input-lg w100" id="cep" value={cep}
                        onChange={(e) => setCep(e.target.value)} />
                </div>

                <div className="input-group">
                    <p>Logradouro</p>
                    <input type="text" className="w100" id="logradouro" value={logradouro}
                        onChange={(e) => setLogradouro(e.target.value)} />
                </div>

                <div className="input-group">
                    <p>Complemento</p>
                    <input type="text" className="w100" id="complemento" value={complemento}
                        onChange={(e) => setComplemento(e.target.value)} />
                </div>

                <div className="input-group">
                    <p>Bairro</p>
                    <input type="text" className="w100" id="bairro" value={bairro}
                        onChange={(e) => setBairro(e.target.value)} />
                </div>

                <div className="input-group">
                    <p>Localidade</p>
                    <input type="text" className="w100" id="localidade" value={localidade}
                        onChange={(e) => setLocalidade(e.target.value)} />
                </div>

                <div className="input-group">
                    <p>Uf</p>
                    <input type="text" className="w100" id="uf" value={uf}
                        onChange={(e) => setUf(e.target.value)} />
                </div>

                <div className="btn-group text-right">
                    <button onClick={() => navigate("/")} className="btn btn-blue-outline">Cancelar</button>
                    <button onClick={SalvarDados} className="btn btn-blue ml-20">Salvar</button>
                </div>

            </div>
        </div>
    </>

}

export default CadEndereco