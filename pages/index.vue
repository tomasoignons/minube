<script setup lang="ts">
  const user = useSupabaseUser();
  watchEffect(() => {
    if (user.value) {
      navigateTo('/dashboard', { replace: true });
    }
  });
</script>
<template>
  <div class="container mx-auto m-5">
    <!-- Hero section -->
    <section class="bg-gray-100 py-20">
      <div class="container mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-16">
          <div class="m-5">
            <h1 class="text-5xl font-bold mb-4">Le site pour connecter Youtubers et Miniamakers</h1>
            <p class="text-gray-700 text-lg mb-8">
              Avec Minube, vous pouvez facilement trouver un miniamaker fiable et compétent pour réaliser vos vidéos, et
              ainsi pleinement vous concentrer sur ce que vous savez faire de mieux:  le contenu.
            </p>
            <NuxtLink
              to="/signup"
              class="inline-block py-3 px-6 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
              >Commencer</NuxtLink
            >
          </div>
          <div>
            <img
              src="~/assets/images/supanuxt_logo_200.png"
              alt="SupaNuxt SaaS Logo" />
          </div>
        </div>
      </div>
    </section>

    <section class="py-12">
      <div class="container px-4 mx-auto">
        <div
          class="flex flex-col md:flex-row items-center justify-center md:justify-between mb-8">
          <h2 class="text-3xl font-bold mb-4 md:mb-0">Ce site a été construit avec:</h2>
        </div>
        <div class="flex flex-col md:flex-row items-center mb-16">
          <div class="md:w-full">
            <ul class="grid grid-cols-3 gap-10 list-none">
              <li>
                <Icon name="skill-icons:nuxtjs-dark" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Nuxt 3</h3>
                <p class="mt-2 text-base text-gray-500">
                  The Progressive Vue.js Framework
                </p>
              </li>
              <li>
                <Icon name="skill-icons:supabase-dark" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Supabase</h3>
                <p class="mt-2 text-base text-gray-500">
                  Auth including OAuth + Postgresql instance
                </p>
              </li>
              <li>
                <Icon
                  name="skill-icons:postgresql-dark"
                  class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">PostgreSQL</h3>
                <p class="mt-2 text-base text-gray-500">Relational Database</p>
              </li>
              <li>
                <Icon name="logos:prisma" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Prisma</h3>
                <p class="mt-2 text-base text-gray-500">
                  Schema management + Strongly typed client
                </p>
              </li>
              <li>
                <Icon name="simple-icons:trpc" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">TRPC</h3>
                <p class="mt-2 text-base text-gray-500">
                  Server/Client communication with Strong types, SSR compatible
                </p>
              </li>
              <li>
                <Icon name="skill-icons:vuejs-dark" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Pinia</h3>
                <p class="mt-2 text-base text-gray-500">State Store</p>
              </li>
              <li>
                <Icon name="logos:stripe" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Stripe</h3>
                <p class="mt-2 text-base text-gray-500">
                  Payments including Webhook integration
                </p>
              </li>
              <li>
                <Icon
                  name="skill-icons:tailwindcss-dark"
                  class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Tailwind</h3>
                <p class="mt-2 text-base text-gray-500">
                  A utility-first CSS framework
                </p>
              </li>
              <li>
                <Icon name="skill-icons:vuejs-dark" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">Vue.js</h3>
                <p class="mt-2 text-base text-gray-500">
                  The Progressive JavaScript Framework
                </p>
              </li>
              <li>
                <Icon name="logos:openai-icon" class="h-12 w-12 mb-2" />
                <h3 class="text-xl font-medium text-gray-900">OpenAI</h3>
                <p class="mt-2 text-base text-gray-500">
                  AI Completions including Note generation from prompt
                </p>
              </li>
            </ul>
          </div>
        </div>
        <div
          class="flex flex-col md:flex-row items-center justify-center md:justify-between mb-8">
          <h2 class="text-3xl font-bold mb-4 md:mb-0">Ce que vous aurez</h2>
        </div>
        <!-- User Management (text left) -->
        <div class="flex flex-col md:flex-row-reverse items-center mb-16">
          <div class="md:w-1/2 md:ml-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_user_management.jpeg"
              alt="User Management"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:ml-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">Recherche de Miniamaker</h3>
            <p class="mb-4">
              Minube vous permet, grâce à des options de filtrage avancées, de trouver
              le miniamaker qui correspond le mieux à vos besoins. Au lieu de rechercher
              sur 20 discords différents, vous pouvez tous les trouver sur un seul site et
              voir en un seul coup d'oeil si il correspond à vos critères.
            </p>
          </div>
        </div>
        <!-- DB Schema (text right)-->
        <div class="flex flex-col md:flex-row items-center mb-16">
          <div class="md:w-1/2 md:mr-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_db_schema_management.jpeg"
              alt="DB Schema Management"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:mr-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">Paiement sécurisé</h3>
            <p class="mb-4">
              Nous utilisons Stripe comme moyen de paiement, ce qui vous garantit une
              sécurité maximale lors de vos transactions. Stripe est notamment utilisé par la SNCF, Deliveroo, ou encore
              Booking.com. Vous pouvez donc être sûr que vos données sont en sécurité. 
              De plus, en cas de soucis avec le miniamaker (commande non faite, pas dans les délais...), vous pouvez demander un remboursement.
            </p>
          </div>
        </div>
        <!-- Config (text left) -->
        <div class="flex flex-col md:flex-row-reverse items-center mb-16">
          <div class="md:w-1/2 md:ml-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_config_environment.jpeg"
              alt="Config and Environment"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:ml-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">Trouver un client</h3>
            <p class="mb-4">
              En tant que miniamaker débutant, il est souvent très difficile de trouver des clients. Minube vous permet de
              vous inscrire en tant que miniamaker, et de commencer à travailler dès maintenant. Vous pouvez fixer vos propres
              tarifs, et les clients intéressés pourront vous contacter directement. Plus besoin de passer par 40 discords différents
            </p>
          </div>
        </div>
        <!-- State Management (text right)-->
        <div class="flex flex-col md:flex-row items-center mb-16">
          <div class="md:w-1/2 md:mr-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_state_management.jpeg"
              alt="State Management"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:mr-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">Portefolio unique</h3>
            <p class="mb-4">
              Minube vous offre la possibilité de créer un portefolio unique, qui vous permettra de vous démarquer des autres miniamakers.
              Vous pourrez y mettre en avant vos compétences, vos réalisations, et vos tarifs. Cela vous permettra de vous faire connaître
              et de trouver des clients. Comme tout se trouve au même endroit, il est très facile de le mettre à jour en un seul clic.
            </p>
          </div>
        </div>
        <!-- Stripe (text left) -->
        <div class="flex flex-col md:flex-row-reverse items-center mb-16">
          <div class="md:w-1/2 md:ml-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_stripe_integration.jpeg"
              alt="Stripe Integration"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:ml-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">Avis directements sur la plateforme</h3>
            <p class="mb-4">
              Dès que vous avez terminé une commande, le client peut laisser un avis directement sur la plateforme. Cela permet
              aux futurs clients de voir si vous êtes fiable, et de vous faire confiance. Vous pouvez également laisser un avis sur le
              client, pour que les autres miniamakers sachent à quoi s'attendre.
            </p>
          </div>
        </div>
        <!-- Tailwind (text right)-->
        <div class="flex flex-col md:flex-row items-center mb-16">
          <div class="md:w-1/2 md:mr-8 mb-8 md:mb-0">
            <img
              src="~/assets/images/landing_style_system.jpeg"
              alt="Style System"
              class="w-full rounded-lg shadow-lg mb-4 md:mb-0 md:mr-4" />
          </div>
          <div class="md:w-1/2">
            <h3 class="text-xl font-bold mb-4">En Bref</h3>
            <p class="mb-4">
              Minube est le site idéal pour les Youtubers qui cherchent à déléguer la réalisation de leurs vidéos à des miniamakers.
              Grâce à des options de filtrage avancées, vous pouvez trouver le miniamaker qui correspond le mieux à vos besoins.
              Vous pouvez également vous inscrire en tant que miniamaker, et commencer à travailler dès maintenant. Vous pouvez fixer
              vos propres tarifs, et les clients intéressés pourront vous contacter directement. Minube vous offre la possibilité de
              créer un portefolio unique, qui vous permettra de vous démarquer des autres miniamakers. Vous pourrez y mettre en avant
              vos compétences, vos réalisations, et vos tarifs. Cela vous permettra de vous faire connaître et de trouver des clients.
            </p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
