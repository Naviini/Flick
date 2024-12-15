<%-- 
    Document   : canteens
    Created on : Dec 12, 2024, 4:10:54 PM
    Author     : ravindupriyankara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SM Booking - Canteen Upload</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --dark-bg: #0d1117;
            --dark-card: #161b22;
            --accent: #ffcc00;
            --text-light: #e6edf3;
            --text-muted: #8b949e;
        }
        body {
            background-color: var(--dark-bg);
            color: var(--text-light);
            font-family: 'Inter', sans-serif;
        }
        a:hover {
            color: var(--dark-bg);
            background-color: var(--accent);
        }
    </style>
</head>
<body class="min-h-screen flex">
    <!-- Sidebar -->
    <aside class="w-72 h-screen bg-dark-card flex flex-col shadow-lg">
        <div class="flex items-center justify-center py-6 border-b border-gray-700">
            <h1 class="text-3xl font-extrabold text-accent">SM Booking</h1>
        </div>
        <nav class="flex-1 px-4 py-6">
            <ul class="space-y-6">
                <li>
                    <a href="movies.jsp" class="flex items-center gap-4 text-sm font-semibold p-4 rounded-lg transition hover:shadow-lg hover:bg-accent">
                        <span class="text-accent">🎬</span>
                        Movies
                    </a>
                </li>
                <li>
                    <a href="users.jsp" class="flex items-center gap-4 text-sm font-semibold p-4 rounded-lg transition hover:shadow-lg hover:bg-accent">
                        <span class="text-accent">👤</span>
                        Users
                    </a>
                </li>
                <li>
                    <a href="canteens.jsp" class="flex items-center gap-4 text-sm font-semibold p-4 rounded-lg transition hover:shadow-lg hover:bg-accent">
                        <span class="text-accent">🍔</span>
                        Canteens / Food & Beverages
                    </a>
                </li>
                <li>
                    <a href="employees.jsp" class="flex items-center gap-4 text-sm font-semibold p-4 rounded-lg transition hover:shadow-lg hover:bg-accent">
                        <span class="text-accent">💼</span>
                        Employees / Admins
                    </a>
                </li>
                <li>
                    <a href="revenue.jsp" class="flex items-center gap-4 text-sm font-semibold p-4 rounded-lg transition hover:shadow-lg hover:bg-accent">
                        <span class="text-accent">💰</span>
                        Revenue
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8">
        <div class="bg-dark-card rounded-lg p-8 shadow-lg relative">
            <div class="absolute -top-12 right-8">
                <!--<svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 text-accent opacity-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h11M9 21V3m0 0L5 7m4-4l4 4" />
                </svg>-->
            </div>
            <h2 class="text-4xl font-bold text-accent mb-6">Upload Food & Beverage Item</h2>
            <p class="text-lg text-text-muted leading-relaxed mb-8">
                Add new items to your canteen menu. Fill in the details below to update the platform.
            </p>

            <form id="canteenUploadForm" class="space-y-8">
                <!-- Item Name -->
                <div>
                    <label for="item_name" class="block text-sm font-medium text-text-light mb-2">Item Name</label>
                    <input 
                        type="text" 
                        id="item_name" 
                        name="item_name" 
                        placeholder="Enter item name"
                        class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                        required
                    />
                </div>

                <!-- Description -->
                <div>
                    <label for="description" class="block text-sm font-medium text-text-light mb-2">Description</label>
                    <textarea 
                        id="description" 
                        name="description" 
                        rows="4"
                        placeholder="Enter item description"
                        class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                        required
                    ></textarea>
                </div>

                <!-- Price -->
                <div>
                    <label for="price" class="block text-sm font-medium text-text-light mb-2">Price</label>
                    <input 
                        type="number" 
                        id="price" 
                        name="price" 
                        step="0.01" 
                        min="0"
                        placeholder="Enter item price"
                        class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                        required
                    />
                </div>

                <!-- Image URL -->
                <div>
                    <label for="image_url" class="block text-sm font-medium text-text-light mb-2">Image URL</label>
                    <input 
                        type="url" 
                        id="image_url" 
                        name="image_url" 
                        placeholder="Enter image URL"
                        class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                        required
                    />
                </div>

                <!-- Submit Button -->
                <div class="flex justify-center">
                    <button 
                        type="submit" 
                        class="py-3 px-10 bg-accent text-dark-bg font-semibold rounded-lg hover:shadow-lg hover:bg-yellow-500">
                        Upload Item
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>

