import axios from "axios";

const API_URL = "http://10.0.0.102:8000/operadoras/";

export async function buscaOperadoras(filtros) {
    try {
        const response = await axios.get(API_URL, { params: filtros });
        return response.data.operadoras;
    } catch (error) {
        console.error("Erro ao buscar operadoras:", error);
        return [];
    }
}
