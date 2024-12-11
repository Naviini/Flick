// Variables for calculations
const ticketPrice = 6.00; // Price per ticket
const vatRate = 0; // 10% VAT
let totalAmount = ticketPrice + (ticketPrice * vatRate); // Starting total amount with VAT
let cartItems = []; // Store cart items

// Function to update the Purchase Summary
function updateSummary() {
    let foodTotal = cartItems.reduce((sum, item) => sum + (item.price * item.qty), 0);
    let newTotal = foodTotal + totalAmount;
    
    document.getElementById('ticketCount').textContent = '1';  // Static for now
    document.getElementById('ticketPrice').textContent = ticketPrice.toFixed(2);
    document.getElementById('vatAmount').textContent = (ticketPrice * vatRate).toFixed(2);
    document.getElementById('totalAmount').textContent = newTotal.toFixed(2);

    // Update the hidden amount for PayPal form
    document.getElementById('hiddenAmount').value = newTotal.toFixed(2);

    // Display the added items in the VAT row
    displayAddedItems();
}

// Function to handle adding food to cart
function addToCart(itemName, itemPrice) {
    // Get the quantity from the input
    const qty = document.querySelector(`.food-item[data-name="${itemName}"] input`).value;

    // Check if the item is already in the cart
    let existingItem = cartItems.find(item => item.name === itemName);
    if (existingItem) {
        // If item exists, update the quantity
        existingItem.qty += parseInt(qty);
    } else {
        // Add new item to cart
        cartItems.push({ name: itemName, price: itemPrice, qty: parseInt(qty) });
    }

    // Update the Purchase Summary
    updateSummary();

    // Display added items in the cart
    displayCartItems();
}

// Function to display added items in the summary table
function displayAddedItems() {
    const addedItemsCell = document.getElementById('added-items');
    addedItemsCell.innerHTML = ''; // Clear previous items

    cartItems.forEach((item, index) => {
        const itemRow = document.createElement('div');
        itemRow.classList.add('cart-item');
        itemRow.innerHTML = `
            <p>${item.name} (x${item.qty}) - USD ${item.price * item.qty} 
            <button onclick="removeItem(${index})">Remove</button>
            </p>
        `;
        addedItemsCell.appendChild(itemRow);
    });
}

// Function to display cart items in a separate section
function displayCartItems() {
    const cartItemsContainer = document.getElementById('cart-items');
    cartItemsContainer.innerHTML = ''; // Clear previous items

    cartItems.forEach((item, index) => {
        const itemRow = document.createElement('div');
        itemRow.classList.add('cart-item');
        itemRow.innerHTML = `
            <p>${item.name} (x${item.qty}) - USD ${item.price * item.qty} 
            <button onclick="removeItem(${index})">Remove</button>
            </p>
        `;
        cartItemsContainer.appendChild(itemRow);
    });
}

// Function to remove an item from the cart
function removeItem(index) {
    // Remove the item from the cart
    cartItems.splice(index, 1);

    // Update the Purchase Summary and cart display
    updateSummary();
    displayCartItems();
}

// Function to switch between sections
function showSection(section) {
    const sections = ['beverages', 'popcorn'];
    sections.forEach(s => {
        document.getElementById(s + '-section').style.display = (s === section) ? 'block' : 'none';
    });

    const buttons = document.querySelectorAll('.tab-button');
    buttons.forEach(button => {
        button.classList.toggle('active', button.textContent.toLowerCase() === section);
    });
}

// Initialize the page
updateSummary();
showSection('beverages');




// Function to validate the form
    function validateForm() {
        const name = document.querySelector('#detailsForm input[type="text"]');
        const phone = document.querySelector('#detailsForm input[type="tel"]');
        const email = document.querySelector('#detailsForm input[type="email"]');
        const terms = document.querySelector('#detailsForm input[type="checkbox"]:first-of-type');

        if (!name.value.trim()) {
            alert("Please enter your full name.");
            name.focus();
            return false;
        }

        const phonePattern = /^\d{10}$/;
        if (!phone.value.trim() || !phonePattern.test(phone.value)) {
            alert("Please enter a valid 10-digit phone number.");
            phone.focus();
            return false;
        }

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.value.trim() || !emailPattern.test(email.value)) {
            alert("Please enter a valid email address.");
            email.focus();
            return false;
        }

        if (!terms.checked) {
            alert("You must agree to the terms and conditions.");
            terms.focus();
            return false;
        }

        return true; // Form is valid
    }


