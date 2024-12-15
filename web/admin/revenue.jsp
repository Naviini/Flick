<%-- 
    Document   : revenue
    Created on : Dec 12, 2024, 4:16:19 PM
    Author     : ravindupriyankara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SM Booking - Revenue</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <h2 class="text-4xl font-bold text-accent mb-6">Revenue Overview</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Total Revenue Card -->
                <div class="bg-gray-800 p-6 rounded-lg shadow">
                    <h3 class="text-2xl font-semibold text-accent">💰 Total Revenue</h3>
                    <p class="text-4xl font-bold text-text-light mt-4">$1,234,567</p>
                </div>
                <!-- Monthly Revenue Card -->
                <div class="bg-gray-800 p-6 rounded-lg shadow">
                    <h3 class="text-2xl font-semibold text-accent">📈 Monthly Revenue</h3>
                    <p class="text-4xl font-bold text-text-light mt-4">$123,456</p>
                </div>
            </div>

            <!-- Revenue Chart -->
            <div class="mt-12">
                <h3 class="text-2xl font-semibold text-accent mb-4">Revenue Trends</h3>
                <div class="bg-gray-800 p-6 rounded-lg shadow">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
        </div>
    </main>

    <script>
        const ctx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Monthly Revenue',
                    data: [120000, 150000, 170000, 130000, 190000, 200000, 180000],
                    borderColor: 'rgba(255, 204, 0, 1)',
                    backgroundColor: 'rgba(255, 204, 0, 0.2)',
                    borderWidth: 2,
                    tension: 0.4,
                }],
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: 'var(--text-light)',
                        },
                    },
                },
                scales: {
                    x: {
                        ticks: {
                            color: 'var(--text-light)',
                        },
                        grid: {
                            color: 'rgba(255, 255, 255, 0.1)',
                        },
                    },
                    y: {
                        ticks: {
                            color: 'var(--text-light)',
                        },
                        grid: {
                            color: 'rgba(255, 255, 255, 0.1)',
                        },
                    },
                },
            },
        });
    </script>
</body>
</html>

