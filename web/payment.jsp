

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Ticket Booking</title>
    <link rel="stylesheet" href="images/payment_styles.css">
    
    
    
   
</head>



<body class="body1">
    <header>
    <div class="header-container">
        <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" alt="Cinema Logo"></a>
        </div>
        <nav class="nav-links">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#movies">Movies</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#book" class="book-now">Book Now</a></li>
            </ul>
        </nav>
    </div>
</header>

    <!-- Main Container -->
    <div class="main-container">
        <!-- Left Section: Food and Beverages -->
        <div class="left-section">
            <h2>Food and Beverage</h2>
            <!-- Tabs -->
            <div class="tabs">
                <button class="tab-button active" onclick="showSection('beverages')">Beverages</button>
                <button class="tab-button" onclick="showSection('popcorn')">Popcorn</button>
            </div>
            <!-- Food Items -->
            <div id="beverages-section" class="food-items">
                <!-- Beverages Section -->
                <div class="food-item" data-price="4" data-name="Americano">
                    <img src="images/americano.jpg" alt="Americano">
                    <div>
                        <p>Americano</p>
                        <p>USD 4.00</p>
                    </div>
                    <input type="number" value="1" min="1" class="qty-input">
                    <button class="add-button" onclick="addToCart('Americano', 4)">Add</button>
                </div>
                <div class="food-item" data-price="4" data-name="Hot Chocolate">
                    <img src="images/hot-chocolate.jpg" alt="Hot Chocolate">
                    <div>
                        <p>HOT Chocolate</p>
                        <p>USD 4.00</p>
                    </div>
                    <input type="number" value="1" min="1" class="qty-input">
                    <button class="add-button" onclick="addToCart('Hot Chocolate', 4)">Add</button>
                </div>
                <div class="food-item" data-price="4" data-name="Cappuccino">
                    <img src="images/cappuccino.jpg" alt="Cappuccino">
                    <div>
                        <p>Cappuccino</p>
                        <p>USD 4.00</p>
                    </div>
                    <input type="number" value="1" min="1" class="qty-input">
                    <button class="add-button" onclick="addToCart('Cappuccino', 4)">Add</button>
                </div>
            </div>

            <div id="popcorn-section" class="food-items" style="display: none;">
                <!-- Popcorn Section -->
                <div class="food-item" data-price="3" data-name="Small Popcorn">
                    <img src="images/small-popcorn.jpg" alt="Small Popcorn">
                    <div>
                        <p>Small Popcorn</p>
                        <p>USD 3.00</p>
                    </div>
                    <input type="number" value="1" min="1" class="qty-input">
                    <button class="add-button" onclick="addToCart('Small Popcorn', 3)">Add</button>
                </div>
                <div class="food-item" data-price="5" data-name="Large Popcorn">
                    <img src="images/large-popcorn.jpg" alt="Large Popcorn">
                    <div>
                        <p>Large Popcorn</p>
                        <p>USD 5.00</p>
                    </div>
                    <input type="number" value="1" min="1" class="qty-input" id="qty-input" >
                    <button class="add-button" onclick="addToCart('Large Popcorn', 5)">Add</button>
                </div>
            </div>
        </div>

        <!-- Right Section: Ticket Details -->
        <div class="right-section">
            <h1>Book Your Cinema Ticket</h1>
            <div class="purchase-summary">
                <h2>Purchase Summary</h2>
                <table id="summary-table">
                    <tr>
                        <td>ADULT Ticket (x <span id="ticketCount">1</span>)</td>
                        <td>USD <span id="ticketPrice">0.00</span></td>
                    </tr>
                    <tr>
                        <td>VAT Included</td>
                        <td>USD <span id="vatAmount">0.00</span></td>
                    </tr>
                    <tr id="added-items-row">
                        <td><strong>Items:</strong></td>
                        <td id="added-items"></td>
                    </tr>
                    <tr>
                        <th>Total</th>
                        <th>USD <span id="totalAmount">0.00</span></th>
                    </tr>
                </table>
            </div>

            <div class="user-details">
                <h3>Your Details</h3>
                <form id="detailsForm" action="submitPayment" method="post">
                    <input type="text" placeholder="First & Last Name" id="username" required>
                    <input type="tel" placeholder="07X XXXXXXX" id="mobile" required pattern="\d{10}">
                    <input type="email" placeholder="Email Address" id="useremail" required>
                    <label>
                        <input type="checkbox" required> I agree to the <a href="terms and conditions.html">Terms & Conditions</a>
                    </label>
                    
                    
                </form>
            </div>

            <!-- Pay with credit or debit card Button -->
             <h1>Make Your Payment</h1>
            


            <!-- PayPal Payment Section -->
            <form action="PayPalServlet" method="POST">
                <input type="hidden" id="hiddenAmount" name="amount" value="">
               
            </form>
             <button  onclick="checkout();" >Pay with PayPal</button>
        </div>
    </div>

  <script src="js/payment.js" defer></script>
 
  <footer>
    <div class="footer-container">
        <div class="footer-section about">
            <h3>About Us</h3>
            <p>Your one-stop destination for booking cinema tickets easily and quickly. Experience movies like never before!</p>
        </div>
        <div class="footer-section links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#privacy">Privacy Policy</a></li>
                <li><a href="#terms">Terms & Conditions</a></li>
                <li><a href="#support">Support</a></li>
            </ul>
        </div>
        <div class="footer-section social">
            <h3>Follow Us</h3>
            <div class="social-links">
                <a href="https://www.facebook.com/"><img src="images/facebook-icon.png" alt="Facebook"></a>
                <a href="https://www.instagram.com/"><img src="images/instagram-icon.png" alt="Instagram"></a>
               
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 FlickBook | All Rights Reserved</p>
    </div>
</footer>
<!-- Add this script before closing body tag -->

<script>
function checkout() {
    // Collect form data
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('useremail').value.trim();
    const phone = document.getElementById('mobile').value.trim();
    let amount = document.getElementById('totalAmount').textContent.trim();
    const terms = document.querySelector('#detailsForm input[type="checkbox"]:first-of-type');

    console.log('Username:', username);
    console.log('Email:', email);
    console.log('Phone:', phone);
    console.log('Raw amount:', amount);

    // Validate inputs
    if (!username || !email || !phone || !amount) {
        alert('Please fill in all fields and ensure a total amount is calculated.');
        return;
    }
    if (!terms.checked) {
            alert("You must agree to the terms and conditions.");
            terms.focus();
            return;
        }
    

    // Remove 'USD ' prefix if present
    if (amount.startsWith('USD ')) {
        amount = amount.replace('USD ', '').trim();
    }
    console.log('Processed amount:', amount);

    // Prepare data for submission
    const data = new URLSearchParams({
        username: username,
        email: email,
        phone: phone,
        amount: amount
    });

    // Send data to server
    fetch('submitPayment', { // Adjusted servlet path
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: data.toString()
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                // alert('Booking confirmed! Booking ID: ' + data.bookingId);

                // Set the hiddenAmount value before submitting the form
                document.getElementById('hiddenAmount').value = amount;

                // Redirect to PayPalServlet programmatically
                setTimeout(function() {
                    window.location.href = 'PayPalServlet?paymentId=' + data.bookingId;
                }, 1000); // Delay the redirect by 1 second to ensure the response is fully processed
            } else {
                alert('Booking failed. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred. Please try again.');
        });
}
</script>



</html>
