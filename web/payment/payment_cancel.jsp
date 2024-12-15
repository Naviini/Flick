<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Cancelled</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body class="body2" onload="cancelPayment();">
    <div class="status-container cancel">
        <div class="icon">
            <img src="images/error.png" alt="Error Icon">
        </div>
        <h1 class="con-h1">Payment Cancelled</h1>
        <p class="message">Your payment was not completed. Please try again.</p>
        <a href="index.jsp" class="back-home-link-c">Go Back to Home</a>
    </div>
    

    <script>
        function cancelPayment() {
            var urlParams = new URLSearchParams(window.location.search);
            var paymentId = urlParams.get('paymentId');
            
            if (paymentId) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/CancelPayment',
                    type: 'POST',
                    data: { paymentId: paymentId },
                    success: function(response) {
                        $('#cancellationStatus').text('Payment and associated data have been successfully deleted.');
                    },
                    error: function(xhr, status, error) {
                        $('#cancellationStatus').text('Error: ' + (xhr.responseJSON ? xhr.responseJSON.error : 'Unknown error occurred'));
                    }
                });
            } else {
                $('#cancellationStatus').text('Error: No payment ID provided.');
            }
        }
    </script>
    
</body>
</html>
