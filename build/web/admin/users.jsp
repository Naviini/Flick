<%-- 
    Document   : users.jsp
    Created on : Dec 12, 2024, 10:32:27 AM
    Author     : ravindupriyankara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SM Booking - Users List</title>
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
            <h2 class="text-4xl font-bold text-accent mb-6">Users List</h2>
            <table class="w-full text-left table-auto border-collapse border border-gray-700">
                <thead>
                    <tr class="bg-gray-800">
                        <th class="p-4 text-text-light border-b border-gray-700">ID</th>
                        <th class="p-4 text-text-light border-b border-gray-700">Name</th>
                        <th class="p-4 text-text-light border-b border-gray-700">Email</th>
                        <th class="p-4 text-text-light border-b border-gray-700">Role</th>
                        <th class="p-4 text-text-light border-b border-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example Row -->
                    <tr class="hover:bg-gray-700">
                        <td class="p-4 border-b border-gray-700 text-text-muted">1</td>
                        <td class="p-4 border-b border-gray-700">John Doe</td>
                        <td class="p-4 border-b border-gray-700">john.doe@example.com</td>
                        <td class="p-4 border-b border-gray-700">Admin</td>
                        <td class="p-4 border-b border-gray-700">
                            <button class="text-sm text-accent hover:underline">Edit</button>
                            <button class="text-sm text-red-500 hover:underline ml-4">Delete</button>
                        </td>
                    </tr>
                    <!-- Additional rows will be dynamically generated -->
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>

