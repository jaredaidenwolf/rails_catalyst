def create_navbar_partial
  file "app/views/shared/_navbar.html.erb", <<-HTML
  <div class="bg-blue-600">
    <nav class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8" aria-label="Global">
      <div class="flex lg:flex-1">
        <a href="/" class="-m-1.5 p-1.5">
          <span class="sr-only">Bookapp</span>
          <img class="h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=white" alt="">
        </a>
      </div>
      <div class="flex lg:hidden">
        <button type="button" class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-indigo-300">
          <span class="sr-only">Open main menu</span>
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
        </button>
      </div>
      <div class="hidden lg:flex lg:gap-x-12">
        <a href="#" class="text-sm font-semibold leading-6 text-white">Link #1</a>
        <a href="#" class="text-sm font-semibold leading-6 text-white">Link #2</a>
        <a href="#" class="text-sm font-semibold leading-6 text-white">Link #3</a>
        <a href="#" class="text-sm font-semibold leading-6 text-white">Link #4</a>
      </div>
      <div class="hidden lg:flex lg:flex-1 lg:justify-end lg:gap-x-12">
        <% if user_signed_in? %>
          <span class="text-sm font-semibold leading-6 text-white"><%= link_to "Sign out", destroy_user_session_path, method: :delete %></span>
        <% else %>
          <span class="text-sm font-semibold leading-6 text-white"><%= link_to "Sign in", new_user_session_path %></span>
          <span class="text-sm font-semibold leading-6 text-white"><%= link_to "Sign up", new_user_registration_path %></span>
        <% end %>
      </div>
    </nav>
    <!-- Mobile menu, show/hide based on menu open state. -->
    <div class="lg:hidden" role="dialog" aria-modal="true">
      <!-- Background backdrop, show/hide based on slide-over state. -->
      <div class="fixed inset-0 z-10"></div>
      <div class="fixed inset-y-0 right-0 z-10 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
        <div class="flex items-center justify-between">
          <a href="#" class="-m-1.5 p-1.5">
            <span class="sr-only">Bookapp</span>
            <img class="h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="">
          </a>
          <button type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700">
            <span class="sr-only">Close menu</span>
            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <div class="mt-6 flow-root">
          <div class="-my-6 divide-y divide-gray-500/10">
            <div class="space-y-2 py-6">
              <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Link #1</a>
              <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Link #2</a>
              <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">link #3</a>
              <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Link #4</a>
            </div>
            <div class="py-6">
              <span class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50"><%= link_to "Sign in", new_user_session_path %></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  HTML
end

def create_alerts_partial
  file "app/views/shared/_alerts.html.erb", <<-HTML
  <div class="container">
    <% if notice %>
      <div class="rounded-md bg-blue-50 p-4">
        <div class="flex">
          <div class="ml-3">
            <div class="mt-2 text-sm text-blue-700">
              <p><%= notice %></p>
            </div>
          </div>
        </div>
      </div>
    <% end %>
    <% if alert %>
      <div class="rounded-md bg-red-50 p-4">
        <div class="flex">
          <div class="ml-3">
            <div class="mt-2 text-sm text-red-700">
              <p><%= alert %></p>
            </div>
          </div>
        </div>
      </div>
    <% end %>
  </div>
  HTML
end

def inject_partials_into_layout
  inject_into_file 'app/views/layouts/application.html.erb', after: "<body>\n" do
    <<-HTML
      <header>
        <%= render "shared/navbar" %>
        <%= render "shared/alerts" %>
      </header>
    HTML
  end
end
