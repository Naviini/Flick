
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core"%>--%> 

<!DOCTYPE html>
<html lang="en" class="overflow-x-hidden">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="js/navbar.js" defer></script>
    <style>
        #logo{
            height: 45px;
            margin-top: 3px;
            /*margin-left: 13px;*/
        }
        #head{
            height: 75px;
        }
        #navigation{
            font-size:20px;
        }
    </style>
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex flex-col" style = "overflow-x: hidden;">

    <!-- Navigation Bar -->
    <header id="head" class="fixed top-0 left-0 w-full z-50 bg-gray-900 bg-opacity-90 backdrop-blur-sm shadow-lg">
      <div class="container mx-auto flex justify-between items-center px-6 py-3">
        <!-- Logo -->
        <h1 class="text-3xl font-extrabold text-teal-300 tracking-wide"> 
            <!--i changed it-->
            <!--<a href="Dashboard/home.jsp"><img src="flick 2.png"/></a>-->
            <a href="home.jsp"><img src="logo.png" id="logo"></a>
             <!--<a href="https://www.tesla.com/"><img src="logo.svg" class="i1"/></a>-->
        </h1>

        <!-- Navigation Menu (Desktop) -->
        <nav id="navigation" class="hidden md:flex space-x-8 text-lg font-medium text-gray-300">
          <a href="#home" class="hover:text-teal-300 transition duration-300">Home</a>
          <a href="#about-us" class="hover:text-teal-300 transition duration-300">About Us</a>
          <a href="#upcoming-movies"" class="hover:text-teal-300 transition duration-300">Movies</a>
          <!--<a href="movies.jsp" class="hover:text-teal-300 transition duration-300">Movies</a>-->
          <a href="#faq" class="hover:text-teal-300 transition duration-300">FAQ</a>
        </nav>

        <!-- Profile Section -->
        <div class="hidden md:flex items-center space-x-4">
          <img src="resources/dashboard/home/profile.svg" alt="User Logo" class="w-10 h-10 rounded-full border-2 border-teal-300">
          
              
          <span class="text-gray-300 font-medium">user@gmail.com</span>
          
          
        </div>

        <!-- Mobile Menu Button -->
        <button id="menu-toggle" class="block md:hidden text-teal-300 focus:outline-none">
          <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
          </svg>
        </button>
      </div>

      <!-- Mobile Navigation Menu -->
      <nav id="mobile-menu" class="hidden bg-gray-800 bg-opacity-90 md:hidden">
        <ul class="flex flex-col space-y-4 text-lg font-medium text-gray-300 py-4 px-6">
          <li><a href="#features" class="block hover:text-teal-300 transition duration-300">Features</a></li>
          <li><a href="#movies" class="block hover:text-teal-300 transition duration-300">Movies</a></li>
          <li><a href="#contact" class="block hover:text-teal-300 transition duration-300">Contact</a></li>
          <li>
            <div class="flex items-center space-x-4">
              <img src="https://via.placeholder.com/40" alt="User Logo" class="w-10 h-10 rounded-full border-2 border-teal-300">
              <span class="text-gray-300 font-medium">...</span>
            </div>
          </li>
        </ul>
      </nav>
    </header>
            
    <!-- Hero Section -->
    <section id = "home" class="relative bg-gray-900 text-white py-20 pt-32 min-h-screen flex items-center">
      <div class="container mx-auto flex flex-col-reverse lg:flex-row items-center lg:justify-between px-6 lg:px-12">
        <!-- Left Content -->
        <div class="lg:w-1/2">
          <h1 class="text-4xl lg:text-6xl font-extrabold leading-tight">
            Discover Amazing Movies<br>
            <span class="text-teal-300">Book Your Tickets Now!</span> 
            <!--i changed it-->
          </h1>
          <p class="mt-4 text-lg text-gray-300">
            Experience the thrill of the latest blockbusters, indie films, and unforgettable classics—all at your fingertips.
          </p>
          <div class="mt-6 flex space-x-4">
              <a href="#movies" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-3 px-6 rounded-lg shadow-md text-lg font-bold transition">
              Explore Movies  
              <!--i changed it-->
            </a>
              
            <a href="#features" class="bg-gray-800 hover:bg-gray-700 border border-gray-600 text-gray-300 py-3 px-6 rounded-lg shadow-md text-lg font-bold transition">
              Learn More
            </a>
          </div>
        </div>

        <!-- Right Content -->
        <div class="lg:w-1/2 flex justify-center lg:justify-end">
          <img src="resources/dashboard/home/3.svg" alt="Cinema Experience" 
               class=" transform hover:scale-105 transition duration-500 ">
        </div>
      </div>

      <!-- Decorative Element -->
      <div class="absolute top-0 left-0 w-48 h-48 bg-teal-300 opacity-20 rounded-full blur-xl"></div>
      <!--<div class="absolute bottom-0 right-0 w-64 h-64 bg-yellow-400 opacity-10 rounded-full blur-2xl"></div>-->
    </section>
    
    <section id="about-us" class="relative bg-gray-900 text-white py-20">
      <!-- Decorative Background Elements -->
      <div class="absolute top-0 left-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-3xl transform -translate-y-16 -translate-x-16"></div>
      <div class="absolute bottom-0 right-0 w-96 h-96 bg-teal-300 opacity-20 rounded-full blur-3xl transform translate-y-16 translate-x-16"></div>

      <div class="relative container mx-auto px-6 lg:px-12">
        <!-- Section Header -->
        <div class="text-center mb-16">
          <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">About Us</h2>
          <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-2xl mx-auto">
            Discover our passion for cinema and how we bring unforgettable movie experiences to life.
          </p>
        </div>

        <!-- Content -->
        <div class="flex flex-col-reverse lg:flex-row items-center lg:justify-between space-y-12 lg:space-y-0 lg:space-x-16">
          <!-- Left Content (Image) -->
          <div class="lg:w-1/2 flex justify-center lg:justify-start">
            <img src="resources/dashboard/home/2.svg" alt="About Us" 
                 class="transform hover:scale-105 transition duration-500" style="width:400px; height:400px;">
          </div>

          <!-- Right Content (Text) -->
          <div class="lg:w-1/2 text-center lg:text-left">
            <h3 class="text-3xl lg:text-4xl font-bold text-white mb-6">Who We Are</h3>
            <p class="text-gray-300 leading-relaxed text-lg">
              At SM Booking, we’re passionate about connecting you with the magic of cinema. From the latest Hollywood blockbusters to indie gems, we bring every story to your fingertips.
            </p>
            <p class="mt-4 text-gray-300 leading-relaxed text-lg">
              Our mission is to create seamless and memorable experiences for every movie lover. Whether it’s your first date, family night out, or a solo escape, we make booking effortless and enjoyable.
            </p>
            <div class="mt-6">
              <a href="#contact" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-3 px-8 rounded-lg font-bold shadow-lg text-lg transition">
                Get in Touch
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section id="upcoming-movies" class="py-20">
        <div class="container mx-auto px-6 lg:px-12 text-center">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">Upcoming Movies</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-2xl mx-auto">
                Get ready for the most anticipated blockbusters and cinematic experiences!
            </p>
        </div>

        <div class="container mx-auto px-6 lg:px-12 mt-12 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="movie" items="${upcomingMovies}">
                <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg hover:shadow-2xl transform hover:scale-105 transition duration-300">
                    <img src="${movie.imageUrl}" alt="${movie.title}" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-2xl font-bold text-teal-300">${movie.title}</h3>
                        <p class="mt-2 text-gray-300">Release Date: ${movie.releaseDate}</p>
                        <p class="mt-4 text-gray-400 text-sm">${movie.description}</p>
                        <div class="mt-6 text-center">
                            <a href="MoviesServlet" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition">
                                Learn More
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <section id="top-rated" class="bg-gray-900 text-white py-20">
        <!-- Decorative Background Elements -->
        <div class="absolute inset-0 overflow-hidden">
          <!--<div class="absolute top-0 left-0 w-96 h-96 bg-purple-500 opacity-20 rounded-full blur-3xl -translate-x-20 -translate-y-20"></div>-->
          <div class="absolute top-0 left-0 w-96 h-96 bg-teal-300 opacity-20 rounded-full blur-3xl -translate-x-20 -translate-y-20"></div>
          <!--<div class="absolute bottom-0 right-0 w-96 h-96 bg-blue-500 opacity-20 rounded-full blur-3xl translate-x-20 translate-y-20"></div>-->
          <div class="absolute bottom-0 right-0 w-96 h-96 bg-teal-300 opacity-20 rounded-full blur-3xl translate-x-20 translate-y-20"></div>
        </div>

        <!-- Section Content -->
        <div class="relative container mx-auto px-6 lg:px-12">
          <!-- Section Header -->
          <div class="text-center mb-16">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">Top Rated Movies</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-2xl mx-auto">
              Experience the finest movies loved by critics and audiences alike.
            </p>
          </div>

          <!-- Movies Grid -->
          <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <c:forEach var="topMovie" items="${topRatedMovies}">
                    <div class="relative group bg-gray-800 rounded-lg shadow-lg overflow-hidden transform hover:scale-105 transition duration-500">
                        <img src="${topMovie.imageUrl}" alt="${topMovie.title}" class="w-full h-80 object-cover">
                        <div class="absolute inset-0 bg-gradient-to-t from-gray-900 to-transparent opacity-80 group-hover:opacity-90 transition duration-500"></div>
                        <div class="absolute bottom-0 p-4">
                            <h3 class="text-lg font-bold text-white">${topMovie.title}</h3>
                            <p class="text-sm text-gray-400">IMDB: ${topMovie.rating}/10</p>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
      </section>

    <section id="testimonials" class="py-20 bg-gray-900 text-white">
        <!-- Decorative Elements -->
        <div class="absolute top-0 left-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-3xl transform -translate-y-16"></div>

        <div class="container mx-auto px-6 lg:px-12 relative">
          <!-- Section Header -->
          <div class="text-center mb-12">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">What Our Users Say</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-3xl mx-auto">
              Real feedback from movie lovers like you!
            </p>
          </div>

          <!-- Testimonials Grid -->
          <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Testimonial Card -->
            <div class="bg-gray-800 p-8 rounded-lg shadow-lg transform hover:scale-105 transition duration-500">
              <p class="text-gray-300 leading-relaxed mb-4">
                "SM Booking makes planning movie nights so effortless. I can't imagine going back to the old way of booking!"
              </p>
              <div class="flex items-center space-x-4">
                <img src="resources/dashboard/home/avatar1.webp" alt="User Avatar" class="w-12 h-12 rounded-full">
                <div>
                  <h3 class="text-teal-300 font-bold">John Doe</h3>
                  <p class="text-gray-400 text-sm">Movie Enthusiast</p>
                </div>
              </div>
            </div>

            <!-- Repeat Testimonial Cards -->
            <div class="bg-gray-800 p-8 rounded-lg shadow-lg transform hover:scale-105 transition duration-500">
              <p class="text-gray-300 leading-relaxed mb-4">
                "The seamless experience and curated recommendations make SM Booking my go-to platform."
              </p>
              <div class="flex items-center space-x-4">
                <img src="resources/dashboard/home/avatar2.webp" alt="User Avatar" class="w-12 h-12 rounded-full">
                <div>
                  <h3 class="text-teal-300 font-bold">Jane Smith</h3>
                  <p class="text-gray-400 text-sm">Film Buff</p>
                </div>
              </div>
            </div>

            <div class="bg-gray-800 p-8 rounded-lg shadow-lg transform hover:scale-105 transition duration-500">
              <p class="text-gray-300 leading-relaxed mb-4">
                "From browsing movies to booking tickets, it's all just a few clicks away!"
              </p>
              <div class="flex items-center space-x-4">
                <img src="resources/dashboard/home/avatar3.webp" alt="User Avatar" class="w-12 h-12 rounded-full">
                <div>
                  <h3 class="text-teal-300 font-bold">Michael Lee</h3>
                  <p class="text-gray-400 text-sm">Frequent Viewer</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    
      <section id="normal-movies" class="py-20 bg-gray-900 text-white">
        <div class="container mx-auto px-6 lg:px-12">
          <!-- Section Header -->
          <div class="text-center mb-12">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">Now Showing</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-3xl mx-auto">
              Enjoy the latest blockbusters and fan favorites in theaters now!
            </p>
          </div>

          <!-- Movie Grid -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Movie Card -->
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg flex items-center space-x-6">
              <img src="https://cdn.dropp.cloud/1uqwog.jpg" alt="Movie Poster" class="w-40 h-60 object-cover rounded-lg">
              <div>
                <h3 class="text-2xl font-bold text-teal-300">Movie Title 1</h3>
                <p class="text-gray-300 mt-2 text-sm leading-relaxed">
                  A brief description of the movie. Catch this thrilling adventure in theaters now!
                </p>
                <div class="mt-4">
                  <span class="text-teal-300 font-bold">Rating:</span>
                  <span class="text-gray-300">4.5/5</span>
                </div>
                <button class="mt-6 bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold hover:bg-teal-300 transition">
                  Book Now
                </button>
              </div>
            </div>

            <!-- Repeat Movie Cards -->
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg flex items-center space-x-6">
              <img src="https://cdn.dropp.cloud/s4wihn.jpg" alt="Movie Poster" class="w-40 h-60 object-cover rounded-lg">
              <div>
                <h3 class="text-2xl font-bold text-teal-300">Movie Title 2</h3>
                <p class="text-gray-300 mt-2 text-sm leading-relaxed">
                  An epic story of love and courage. Don't miss it on the big screen.
                </p>
                <div class="mt-4">
                  <span class="text-teal-300 font-bold">Rating:</span>
                  <span class="text-gray-300">4.3/5</span>
                </div>
                <button class="mt-6 bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold hover:bg-teal-300 transition">
                  Book Now
                </button>
              </div>
            </div>

            <!-- Add more cards as needed -->
          </div>
        </div>
      </section>


    <section id="faq" class="py-20 bg-gray-900 text-white">
        <div class="container mx-auto px-6 lg:px-12">
          <!-- Section Header -->
          <div class="text-center mb-12">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">Frequently Asked Questions</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-3xl mx-auto">
              Have questions? We’ve got answers!
            </p>
          </div>

          <!-- FAQ List -->
          <div class="space-y-6">
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h3 class="text-lg font-bold text-teal-300">How can I book a ticket?</h3>
              <p class="text-gray-300 mt-2">Simply browse our collection of movies, choose a showtime, and click "Book Now." It’s that easy!</p>
            </div>
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h3 class="text-lg font-bold text-teal-300">Can I cancel my ticket?</h3>
              <p class="text-gray-300 mt-2">Yes, you can cancel your ticket up to 24 hours before the showtime. Check your account dashboard for cancellation options.</p>
            </div>
            <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
              <h3 class="text-lg font-bold text-teal-300">Do you offer discounts?</h3>
              <p class="text-gray-300 mt-2">Yes! Sign up for our newsletter or check our promotions page for the latest deals and discounts.</p>
            </div>
          </div>
        </div>
      </section>


    <footer class="bg-gray-900 text-white py-10">
        <div class="container mx-auto px-6 lg:px-12 grid grid-cols-1 md:grid-cols-4 gap-8">
          <!-- About Section -->
          <div>
            <h3 class="text-teal-300 font-bold text-lg mb-4">About Us</h3>
            <p class="text-gray-300 text-sm leading-relaxed">
              Welcome to SmBookings! Your ultimate destination for the latest movies and theater experiences.
            </p>
          </div>

          <!-- Quick Links -->
          <div>
            <h3 class="text-teal-300 font-bold text-lg mb-4">Quick Links</h3>
            <ul class="space-y-2">
              <li><a href="#" class="text-gray-300 hover:text-teal-300 transition">Home</a></li>
              <li><a href="#" class="text-gray-300 hover:text-teal-300 transition">Top Movies</a></li>
              <li><a href="#" class="text-gray-300 hover:text-teal-300 transition">Now Showing</a></li>
              <li><a href="#" class="text-gray-300 hover:text-teal-300 transition">Contact Us</a></li>
            </ul>
          </div>

          <!-- Contact Info -->
          <div>
            <h3 class="text-teal-300 font-bold text-lg mb-4">Contact Us</h3>
            <p class="text-gray-300 text-sm">
              <strong>Email:</strong> support@smbookings.com<br>
              <strong>Phone:</strong> +123 456 7890<br>
              <strong>Address:</strong> 123 Cinema St, Movietown, USA
            </p>
          </div>

          <!-- Social Media -->
          <div>
            <h3 class="text-teal-300 font-bold text-lg mb-4">Follow Us</h3>
            <div class="flex space-x-4">
              <a href="#" class="text-gray-400 hover:text-teal-300">
                <img src="resources/landing/fb.svg" loading="lazy" class="w-6 h-6" alt="Fb Icon">
              </a>
              <a href="#" class="text-gray-400 hover:text-teal-300">
                <img src="resources/landing/twitter.svg" loading="lazy" class="w-6 h-6" alt="Twitter Icon">
              </a>
              <a href="#" class="text-gray-400 hover:text-teal-300">
                <img src="resources/landing/insta.svg" loading="lazy" class="w-6 h-6" alt="Insta Icon">
              </a>
            </div>
          </div>
        </div>

        <!-- Bottom Bar -->
        <div class="mt-10 border-t border-gray-700 pt-6 text-center text-sm text-gray-500">
          &copy; 2024 SmBookings. All Rights Reserved. | <a href="#" class="text-teal-300 hover:underline">Privacy Policy</a>
        </div>
      </footer>

</body>
</html>

