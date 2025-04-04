<template>
    <div class="container-fluid mt-4 px-5">
      <h2 class="text-center">Operadoras Ativas na ANS</h2>
      
      <filtroOperadoras
        :filtros="filtros"
        :loading="loading"
        @buscar="buscar"
        @limpar="limpaFiltros"
      />
      
      <tabelaOperadoras
        :operadoras="operadoras"
        :loading="loading"
        :verifica-busca="verificaBusca"
      />
    </div>
  </template>
  
  <script>
  import {buscaOperadoras} from "../js/api.js";
  import filtroOperadoras from "./filtroOperadoras.vue";
  import tabelaOperadoras from "./tabelaOperadoras.vue";
  
  export default {
    components: {
        filtroOperadoras,
        tabelaOperadoras
    },
    
    data() {
      return {
        filtros: {
          registro_ans: "",
          cnpj: "",
          razao_social: "",
          modalidade: "",
          cidade: "",
          uf: "",
        },
        operadoras: [],
        verificaBusca: false,
        loading: false,
      };
    },
  
    methods: {
      async buscar() {
        try {
          this.verificaBusca = false;
          this.loading = true;
          const resultado = await buscaOperadoras(this.filtros);
          this.operadoras = Array.isArray(resultado) ? resultado : [];
        } catch (error) {
          console.error("Erro ao buscar operadoras:", error);
          this.operadoras = [];
        } finally {
          this.verificaBusca = true;
          this.loading = false;
        }
      },
  
      limpaFiltros() {
        Object.keys(this.filtros).forEach((key) => (this.filtros[key] = ""));
        this.operadoras = [];
        this.verificaBusca = false;
      },
    }
  };
  </script>