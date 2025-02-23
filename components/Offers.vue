<template>
    <div class="px-5 pb-5">
      <h1 class="text-4xl font-bold mb-10">Offers</h1>
      <div v-if="loading">Loading...</div>
      <div v-else class="flex gap-5 flex-wrap">
        <div v-for="offer in offers" :key="offer.id" class="bg-gray-200 max-w-33 min-w-lg rounded-xl overflow-hidden ratio-4 flex flex-col gap-3">
          <img :src="`/uploads/${offer.image}.png`" alt="Offer Image" class="w-full h-2/3 object-cover" />
          <div class="px-4 flex justify-between h-1/3">
            <div class="flex flex-col w-4/5 h-85 gap-2">
              <h2 class="text-2xl font-bold">{{ offer.title }}</h2>
              <p class="overflow-hidden text-clip">{{ offer.description }}</p>
            </div>
            <p><span class="font-bold text-3xl w-1/5">{{ offer.price }}</span> CHF</p>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  const offers = ref([]);
  const loading = ref(true);
  
  const fetchOffers = async () => {
    try {
      const response = await $fetch('/api/offers');
      offers.value = response;
    } catch (error) {
      console.error('Error fetching offers:', error);
    } finally {
      loading.value = false;
    }
  };
  
  const getImagePath = (imageName) => {
    return (`~/assets/uploads/${imageName}.png`);
  };

  onMounted(() => {
    fetchOffers();
  });
  </script>
  
  <style scoped>
  .ratio-4 {
    aspect-ratio: 1185/1000;
  }
  .max-w-33 {
    max-width: 32%;
  }

  .min-w-lg{
    min-width: 500px;
  }

  .h-85 {
    height: 85%;
  }
  </style>