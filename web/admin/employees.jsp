<%-- 
    Document   : employees
    Created on : Dec 12, 2024, 4:14:13 PM
    Author     : ravindupriyankara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SM Booking - Admins & Employees</title>
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
        <div class="bg-dark-card rounded-lg p-8 shadow-lg">
            <h2 class="text-4xl font-bold text-accent mb-6">Manage Admins & Employees</h2>

            <!-- Add New User Form -->
            <div class="mb-12">
                <h3 class="text-2xl font-semibold text-accent mb-4">Add New User</h3>
                <form id="addUserForm" class="space-y-6">
                    <div>
                        <label for="username" class="block text-sm font-medium text-text-light mb-2">Username</label>
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            placeholder="Enter username"
                            class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                            required
                        />
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-text-light mb-2">Email</label>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            placeholder="Enter email"
                            class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                            required
                        />
                    </div>
                    <div>
                        <label for="role" class="block text-sm font-medium text-text-light mb-2">Role</label>
                        <select 
                            id="role" 
                            name="role" 
                            class="w-full p-4 rounded-lg bg-gray-800 text-text-light border border-gray-700 focus:outline-none focus:ring-2 focus:ring-accent"
                            required
                        >
                            <option value="admin">Admin</option>
                            <option value="employee">Employee</option>
                        </select>
                    </div>
                    <div class="flex justify-center">
                        <button 
                            type="submit" 
                            class="py-3 px-10 bg-accent text-dark-bg font-semibold rounded-lg hover:shadow-lg">
                            Add User
                        </button>
                    </div>
                </form>
            </div>

            <!-- Users List -->
            <div>
                <h3 class="text-2xl font-semibold text-accent mb-4">Existing Users</h3>
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-sm text-text-light">
                        <thead class="bg-gray-700">
                            <tr>
                                <th class="px-6 py-3">Username</th>
                                <th class="px-6 py-3">Email</th>
                                <th class="px-6 py-3">Role</th>
                                <th class="px-6 py-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Example Row -->
                            <tr class="border-b border-gray-700 hover:bg-gray-800">
                                <td class="px-6 py-4">john_doe</td>
                                <td class="px-6 py-4">john.doe@example.com</td>
                                <td class="px-6 py-4">Admin</td>
                                <td class="px-6 py-4">
                                    <button class="text-accent hover:underline mr-4">Edit</button>
                                    <button class="text-red-500 hover:underline">Delete</button>
                                </td>
                            </tr>
                            <!-- More rows will be dynamically added -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</body>
</html>