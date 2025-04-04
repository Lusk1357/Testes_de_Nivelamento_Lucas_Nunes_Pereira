export function formataCNPJ(cnpj) {
    if (!cnpj) return "-";
    const strCNPJ = cnpj.toString().padStart(14, "0");
    return strCNPJ.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
  }
  
  export function formataCEP(cep) {
    if (!cep) return "-";
    const strCEP = cep.toString().padStart(8, "0");
    return strCEP.replace(/^(\d{5})(\d{3})$/, "$1-$2");
  }
  
  export function formataTelefone(ddd, telefone) {
    if (!telefone) return "-";
    const t = telefone.toString().padStart(8, "0");
    const strDDD = ddd ? `(${ddd}) ` : "";
    return strDDD + t.replace(/(\d{4})(\d{4})$/, "$1-$2");
  }