<template>
  <form @submit.prevent="$emit('buscar')" class="row g-3">
    <div class="col-md-4" v-for="(label, key) in campos" :key="key">
      <label class="form-label">{{ label }}</label>
      <input 
        type="text" 
        v-model="filtrosProxy[key]" 
        class="form-control"
      >
    </div>

    <div class="col-12 text-center mt-3">
      <button type="submit" class="btn btn-primary" :disabled="loading">
        <span v-if="loading" class="spinner-border spinner-border-sm"></span>
        Buscar
      </button>
      <button type="button" @click="$emit('limpar')" class="btn btn-secondary ms-2">
        Limpar
      </button>
    </div>
  </form>
</template>

<script>
export default {
  props: {
    filtros: Object,
    loading: Boolean
  },
  
  computed: {
    filtrosProxy: {
      get() {
        return this.filtros
      },
      set(value) {
        this.$emit('update:filtros', value)
      }
    }
  },

  data() {
    return {
      campos: {
        registro_ans: "Registro ANS",
        cnpj: "CNPJ",
        razao_social: "Razão Social",
        modalidade: "Modalidade",
        cidade: "Cidade",
        uf: "UF",
      }
    }
  }
}
</script>