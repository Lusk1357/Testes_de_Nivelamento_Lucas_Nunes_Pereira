<template>
   <div v-if="operadoras.length && !loading" class="mt-4">
  <div class="table-responsive">
    <table class="table table-bordered table-striped table-sm table-hover align-middle">
      <thead class="table-dark text-nowrap">
        <tr>
          <th v-for="label in colunas" :key="label" class="text-center">{{ label }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="operadora in operadoras" :key="operadora.Registro_ANS">
          <td class="text-nowrap text-center">{{ operadora.Registro_ANS }}</td>
          <td class="text-nowrap">{{ formataCNPJ(operadora.CNPJ) }}</td>
          <td>{{ operadora.Razao_Social }}</td>
          <td class="text-nowrap">{{ operadora.Modalidade }}</td>
          <td>{{ operadora.Logradouro }}</td>
          <td class="text-nowrap">{{ operadora.Numero }}</td>
          <td>{{ operadora.Bairro }}</td>
          <td>{{ operadora.Complemento }}</td>
          <td>{{ operadora.Cidade }}</td>
          <td class="text-nowrap text-center">{{ operadora.UF }}</td>
          <td class="text-nowrap">{{ formataCEP(operadora.CEP) }}</td>
          <td class="text-nowrap">{{ formataTelefone(operadora.DDD, operadora.Telefone) }}</td>
          <td class="text-nowrap">
            <a v-if="operadora.Endereco_eletronico" :href="'mailto:' + operadora.Endereco_eletronico">
              {{ operadora.Endereco_eletronico }}
            </a>
            <span v-else>-</span>
          </td>
          <td>{{ operadora.Representante }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
  
    <p v-if="!operadoras.length && verificaBusca && !loading" class="text-center text-danger">
      Nenhuma operadora ativa encontrada.
    </p>
  </template>
  
  <script>
  import { formataCNPJ, formataCEP, formataTelefone } from "../js/utilOperadoras.js";
  
  export default {
    props: {
      operadoras: Array,
      loading: Boolean,
      verificaBusca: Boolean
    },
    
    data() {
      return {
        colunas: [
          "Registro ANS", "CNPJ", "Razão Social", "Modalidade", "Logradouro",
          "Número", "Bairro", "Complemento", "Cidade", "UF", "CEP",
          "Telefone", "E-mail", "Representante",
        ]
      };
    },
    
    methods: {
      formataCNPJ,
      formataCEP,
      formataTelefone
    }
  };
  </script>