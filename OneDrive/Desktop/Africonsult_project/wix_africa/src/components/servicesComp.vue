<template>
  <div class="flex flex-col items-center w-80 mx-auto">
    <img :src="require(`@/assets/${image}`)" alt="Image" class="w-full h-80"/>
    <div class="flex flex-col items-start bg-[#F7F7F7] w-full py-8 px-5 gap-4">
      <h1 class="text-left text-[#3D5975] text-4xl font-semibold">{{ props.heading }}</h1>
      <p class="text-left text-xl">{{ props.text }}</p>
    </div>
  </div>
</template>

<script setup>
import defineProps from 'vue'
const props = defineProps({
  heading: {
    type: String,
    required: true,
    default:"I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font."
  },
  text: {
    type: String,
    required: true,
    default:"I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font."
  },
  image: {
    type: String,
    required: true,
    default:"I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font."
  }
});

</script>
