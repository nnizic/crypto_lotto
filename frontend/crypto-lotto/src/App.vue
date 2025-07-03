<template>
  <main class="p-6 font-sans bg-gray-50 min-h-screen">
    <h1 class="text-3xl font-bold text-center mb-6">CryptoLotto 🎰</h1>
    <router-view />
  </main>
</template>
<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #1e1e2f;
  color: #f1f1f1;
}

h1, h2, h3 {
  color: #ffd700; /* zlatna */
}

a {
  color: #00bfff;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.container {
  max-width: 900px;
  margin: 0 auto;
  padding: 2rem;
}
</style>

