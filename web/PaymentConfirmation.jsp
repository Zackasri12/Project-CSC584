<%@ page import="model.Payment" %>
<%
    Payment payment = (Payment) request.getAttribute("payment");
%>
<h2>Payment Submitted Successfully</h2>
<p><strong>Order ID:</strong> <%= payment.getOrderId() %></p>
<p><strong>Payment Date:</strong> <%= payment.getPaymentDate() %></p>
<p><strong>Amount:</strong> RM <%= String.format("%.2f", payment.getAmount()) %></p>
<p><strong>Method:</strong> <%= payment.getPaymentMethod() %></p>
<p><strong>Status:</strong> <%= payment.getStatus() %></p>
